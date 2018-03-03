unit bst_ev;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ImgList, Buttons, ToolWin, ExtCtrls,bstdb,DbTables,DB, Menus, Qrctrls, QuickRpt,cls_utils,
  ADODB, OleCtrls,fonctions, ActnList;

type
  Tfrm_ev = class(Tfrm_obj)
    TabSheet2: TTabSheet;
    ts_lay: TTabSheet;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    SpeedButton17: TSpeedButton;
    GroupBox1: TGroupBox;
    lb_cpo: TStringGrid;
    Query1: TQuery;
    SpeedButton1: TSpeedButton;
    od1: TOpenDialog;
    Panel1: TPanel;
    Label7: TLabel;
    TV_tab: TTreeView;
    Panel2: TPanel;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton97: TSpeedButton;
    GroupBox3: TGroupBox;
    SpeedButton7: TSpeedButton;
    Label9: TLabel;
    dbg_evento: TDBGrid;
    sptel: TSpeedButton;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    Dbmemo1: TDBRichEdit;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    dbg_lay: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label11: TLabel;
    SPP1: TSpeedButton;
    Label6: TLabel;
    sp6: TSpeedButton;
    DBEdit4: TDBEdit;
    dbrg_cli: TDBRadioGroup;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    dbmemo2: TDBRichEdit;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Laypost(Dataset : TdataSet);
    procedure dbg_layKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem1Click(Sender: TObject);
    procedure SPP1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TV_tabClick(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure Dbmemo1Exit(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure lb_cpoDblClick(Sender: TObject);
    procedure dbmemo2Enter(Sender: TObject);
    procedure Dbmemo1Enter(Sender: TObject);
    procedure dbg_eventoEnter(Sender: TObject);
    procedure dbg_layEnter(Sender: TObject);
    procedure dbmemo2Click(Sender: TObject);
    procedure Dbmemo1Click(Sender: TObject);
    procedure TV_tabDblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dbg_dgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sp6Click(Sender: TObject);
    procedure sptelClick(Sender: TObject);
    procedure sp_altClick(Sender: TObject);
    procedure SpeedButton97Click(Sender: TObject);
  private
    procedure Evpost(Dataset: TdataSet);
    procedure Abre_banco;
    procedure copia;

    { Private declarations }
  public
    procedure imprime(pTipo: string);
    procedure Loadconstantobj;override;

  end;

  uoe = ^TOe;
  TOe = record
     FCodigo: integer;
     fCli   : integer;
     fProj  : integer;
     fTipo  : string;
     fBd    : string;
     fTipo_banco : integer;
  end;
var
  frm_ev: Tfrm_ev;
  iEvento,ilay : Tdados_tab;
  Wtab,Bd_Ant : string;
  Ev_codigo,p : integer;
  mOe : uOe;
  Wactive : TwinControl;
  iTab : Tdad;
implementation

uses bst_main, bst_dir4, bst_treeAtiv, bst_puc, bst_dm_rel;

{$R *.dfm}

procedure Tfrm_ev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  If itab <> nil then
   Begin
      If iTab.IndexName <> '' then
         itab.IndexName := '';
      freeandnil(itab);
   end;

  frm_ev  := nil;
  action := caFree;
end;

procedure Tfrm_ev.BitBtn1Click(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure Tfrm_ev.FormShow(Sender: TObject);
var
  iTab : Tdados_tab;
  IpAI : INTEGER;
begin
  inherited;
   If (frm_main.viewer) or (oAcesso.waccess = 1) then
   begin
     speedbutton17.Visible := false;
     ToolButton4.Enabled := false;
     ToolButton5.Enabled := false;
   end;

  If dbrg_cli.itemIndex = -1 then
     dbrg_cli.itemIndex := 0;
  iPai := ID;
  tb_atv.TabVisible  := false;
  tb_dados.TabVisible:= false;
  try
    iTab := Tdados_tab.create(self);
    with iTab do
     begin         { TODO -c6-000-24 : Subsituido OI por WTipoObkjto para tratar Tipo OC tnmabem }
      // Get_Correlatos(Cliente,CENARIO,'OI',iPai,'OE','IDF_OE');
      Get_Correlatos(Cliente,CENARIO,WtipoObjeto,iPai,'OE','IDF_OE');
        while not eof do
          Begin
            new(mOe);
            moe.fCLi    := cliente;
            moe.fProj   := Cenario;
            mOe.fCodigo := fieldbyname('IDF_CODIGO').asinteger;
            mOe.fTipo   := fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
            mOe.fBD     := fieldbyname('IDF_NOME').asstring;
            mOe.fTipo_Banco     := fieldbyname('SUB_ID').asinteger;
            tv_Tab.Items.AddObject(nil,fieldbyname('IDF_DESIGNACAO').asstring,mOe);

           next;
          end;
      // Get_Correlatos(Cliente,CENARIO,'OI',iPai,'IF','IDF_IF');
        Get_Correlatos(Cliente,CENARIO,WtipoObjeto,iPai,'IF','IDF_IF');
       while not eof do
          Begin
            new(mOe);
            moe.fCLi  := Cenario;
            moe.fProj := Cliente;
            mOe.fCodigo := fieldbyname('IDF_CODIGO').asinteger;
            mOe.fTipo   := fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
            mOe.fBD     := fieldbyname('IDF_NOME').asstring;
            tv_Tab.Items.AddObject(nil,fieldbyname('IDF_DESIGNACAO').asstring,mOe);

           next;
          end;
     end;
  finally
     FREEANDNIL(ItAB);
  end;
end;

procedure Tfrm_ev.pgcpChange(Sender: TObject);
begin
  inherited;

  If dbg_evento.DataSource <> nil then
      SpeedButton17Click(nil);

  begin
     if pgcp.ActivePage <> tb_geral then
      begin
       {If dbmemo2.Text = '' then
          dbmemo2.Text := 'OBJETIVO'; }
      end
     else

     If pgcp.ActivePage = TabSheet2 then       // eventos
       begin
        If iEvento = nil then
           iEvento := Tdados_Tab.create(self);
        with iEvento do
         begin
            Get_Correlatos(self.cliente,self.cenario,wtipoObjeto,Id,'EV','IDF_EV') ;
            dbg_evento.DataSource := dataext;
            DbMemo1.DataSource := dataext;
            dbmemo1.dataField := 'IDF_MINIESPECIFICACAO';
            dbedit3.DataSource := dataext;
            BeforePost := EvPost;
         end;
       end
  else
     begin

       If pgcp.ActivePage = Ts_lay then       // lay out
        begin
          If iLay = nil then
             iLay := Tdados_Tab.create(self);
          with iLay do
           begin
             Get_layout(Cliente,Cenario,Id);
             dbg_lay.DataSource := Dataext;
             BeforePost         := layPost;
           end;
        end;
     end;
  end;
end;

procedure Tfrm_ev.Laypost(Dataset : TdataSet);
begin
   dbg_lay.DataSource.DataSet.FieldByName('CLI_ID').value := cliente;
   dbg_lay.DataSource.DataSet.FieldByName('PRJ_ID').value := cenario;
   dbg_lay.DataSource.DataSet.FieldByName('LAY_OI').value := id;
end;

procedure Tfrm_ev.Evpost(Dataset : TdataSet);
begin
 with Tdados_tab.create(self) do
  begin
     try
       CLI_ID := cliente;
       PRJ_ID := cenario;
       dbg_evento.DataSource.DataSet.FieldByName('CLI_ID').value     := cliente;
       dbg_evento.DataSource.DataSet.FieldByName('PRJ_ID').value     := cenario;
       dbg_evento.DataSource.DataSet.FieldByName('IDF_CODIGO').value := get_MaxKey('IDF_EV')+1;
       Cria_Correlacao(Cliente,Cenario,wtipoObjeto,self.Id,'EV',dbg_evento.DataSource.DataSet.FieldByName('IDF_CODIGO').value,' ',0,0);
     finally
        free;
     end;
  end;
end;

procedure Tfrm_ev.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_EV' ;
       ListaTit := def18;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       Listafecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       //dbg_evento.DataSource.DataSet.FieldByName('IDF_CODIGO').value ;
       Cria_Correlacao(Cliente,Cenario,TIPO,self.Id,'EV',ListaCodigo,' ',0,0);
       Close;
       free;
     end;
   pgcpChange(frm_ev);  
end;

procedure Tfrm_ev.dbg_layKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key = VK_DELETE then
   begin
     if MessageDlg(mens27, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      raise exception.create(mens25)
     else
     begin
       // Aqui deverei colocar o código para o caso de confirmação de deleção.

     end;
   end;
end;

procedure Tfrm_ev.MenuItem1Click(Sender: TObject);
begin
  inherited;
  If MessageDlg(mens24,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       iEvento.Apaga_correlacao(cliente,cenario,wTipoObjeto,ID,'EV',
                 DBG_EVENTO.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger);
       pgcpChange(frm_ev);
     end;
end;

procedure Tfrm_ev.SPP1Click(Sender: TObject);
begin
  inherited;
  // Mostra_Dir(self);
  If od1.Execute then
   Begin
     iDataSource.DataSet.edit;
     Dbedit2.field.text := od1.FileName;
   end;

end;

procedure Tfrm_ev.FormCreate(Sender: TObject);
begin
  inherited;
  Bd_ant := '';
  dbrg_cli.ItemIndex := 0;
  pgcp.ActivePage := Tb_geral;
  lb_cpo.ColWidths[0] := 140;
  lb_cpo.ColWidths[1] := 60;
  if (frm_main.viewer) or (oAcesso.WACCESS = 1) then
  begin
     sp2.visible := false;
     spp1.visible := false;
     sp_insert.visible := false;
     ToolButton4.Enabled := false;
     ToolButton5.Enabled := false;
  end;
  if frm_treeativ <> nil then
  begin
     sp_insert.visible := false;
     if  tv.Diagrama.SelectedNode <> nil then
     begin
       Ev_codigo := tv.Diagrama.SelectedNode.Userdata;
       If tv.Diagrama.SelectedNode.Shape =  8 then //'objeto_controle'
       begin
         WTipoObjeto := 'OC';
//         dbmemo2.height := 221;
         TabSheet2.caption := def19;
       end
       else
       begin
         WTipoObjeto := 'OI';
         TabSheet2.caption := def18;
       end
      end;
   end
  else
   begin
     If WTipoObjeto =  'OC' then
       begin
         caption := def20;
//         dbmemo2.height := 221;
         TabSheet2.caption := def19;
         sp6.visible := false;
         dbedit1.Visible := false;
       end
     else
       begin
         WTipoObjeto    := 'OI';
         caption := def21;
         TabSheet2.caption := def18;
       end ;
   end;

    If WtipoObjeto = 'OI' then
        begin
          ts_Lay.tabvisible := true;
          caption := def86;

        end
    else
       begin
           ts_Lay.tabvisible := false  ;
           caption := def87;
           sp6.visible := false;
           dbedit1.Visible := false;
       end;

end;

procedure Tfrm_ev.TV_tabClick(Sender: TObject);
var
  I, iCode : integer;
begin
  inherited;
   iTab := Tdad.create(self);
   // Se o quadro está vazio, não há o que fazer.
   if TV_tab.Items.Count = 0 then
     exit;

    If uOe(tv_TAB.Selected.data)^.fTipo = 'OE' then
      Begin
       Lb_cpo.Visible := true;
       dbgrid1.Visible :=  false;
       abre_banco ;
      end
    else
     begin
     If uOe(tv_TAB.Selected.data)^.fTipo = 'IF' then
        Begin
          with iTab do
           begin
          // Get_Correlatos(Cliente,CENARIO,uoe(Tv_Tab.Selected.data)^.fTipo,
          //                 uOe(Tv_Tab.Selected.data)^.fCodigo,'DE','IDF_DE');

            Lb_cpo.Visible := false;
            dbgrid1.Visible := true;
            CLI_ID := CLIENTE;
            PRJ_ID := CENARIO;

            iCode := uOe(Tv_Tab.Selected.data)^.fCodigo;


            dbgrid1.DataSource := itab.DataExt;
            Get_dados_unico(tv_tab.selected.text, iCode);
           end;
       end;
     end;
end;

procedure TFRM_ev.Abre_banco;
var
  i ,k: integer;
  t : variant;
  wnom,Wtipo,Wtam,wnom1 : string;
  idbAdo : TAdoConnection;
  fechatree : boolean;
begin
  fechatree := false;
  if  (uOe(Tv_Tab.Selected.data)^.fBd <> Bd_ant) or (uOe(Tv_Tab.Selected.data)^.fBd = '') then
  begin
    if frm_TreeAtiv = nil then
    begin
      frm_Treeativ := Tfrm_Treeativ.Create(self);
      fechatree := true;
    end;

      case uOe(Tv_Tab.Selected.data)^.fTipo_banco of
       0 : Begin
             frm_Treeativ.iDbext.connected        := false;
             frm_Treeativ.iDbext.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+uOe(Tv_Tab.Selected.data)^.fBd+';Persist Security Info=False';
             iDBado := frm_Treeativ.idbExt;

           end;
       1 : Begin
             frm_Treeativ.iDbParadox.connected        := false;
             frm_Treeativ.idbParadox.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+uOe(Tv_Tab.Selected.data)^.fBd+';Extended Properties=Paradox 7.x;Persist Security Info=False';
             IdbAdo := frm_Treeativ.iDbParadox;
           end;

       2 : Begin         //dbase
             frm_Treeativ.iDbDbase.connected        := false;
             frm_Treeativ.idbDbase.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+uOe(Tv_Tab.Selected.data)^.fBd+';Extended Properties=Dbase III;Persist Security Info=False';
             IdbAdo := frm_Treeativ.iDbDbase;
           end;
       { TODO -c6-00-0029b : Acrescentado : sql server }
       3 : Begin         //SQLSERVER
             frm_Treeativ.IdbsqlServer.connected        := false;
             IdbAdo := frm_Treeativ.IdbsqlServer;
           end;
        end;
      idbAdo.GetFieldNames(tv_tab.Selected.Text,lb_cpo.Cols[0]);

      bd_ant :=  uOe(Tv_Tab.Selected.data)^.fBd;
      if fechatree then
       frm_treeativ.close;
  end;
end;

procedure Tfrm_ev.sp_printClick(Sender: TObject);
begin
  Imprime('V');
end;

procedure Tfrm_ev.imprime(pTipo : string);
var
  iTab,iLay: Tdados_tab;
begin
  inherited;
  if frm_puc = nil then
     frm_puc := Tfrm_Puc.Create(self);

  frm_puc.qrp.DataSet := iDataSource.DataSet;
  qrDataset(frm_puc.qrband2,iDataSource.DataSet);
   iTab := Tdados_tab.create(self);
   qrDataset(frm_puc.QRsubdetail1,iTab);
   iTab.Get_Correlatos(Cliente,cenario,wtipoObjeto,Id,'EV','IDF_EV');

   iLay := Tdados_tab.create(self);
   try
    If Tipo = 'OI' then
    Begin
       qrDataset(frm_puc.QRsubdetail2,iLay);
       iLay.Get_layout(Cliente,Cenario,Id);
       frm_puc.titulo.caption := uppercase(def6);
       frm_puc.QRLabel19.caption := def18;
       If ilay .eof then
          Begin
            frm_puc.qrband1.height := 0;
            frm_puc.qrsubdetail2.height := 0;
          end;
    end
    else
    Begin
       frm_puc.qrband1.height := 0;
       frm_puc.QRSubDetail2.height := 0;
       frm_puc.titulo.caption    := uppercase(def7);
       frm_puc.QRLabel19.caption := def19;
    end;


  frm_Puc.subtitulo.caption := Dbedit4.text;
  If pTipo = 'V' then
     frm_puc.qrp.Preview
  else
      frm_puc.qrp.print;;
  frm_puc.close;
   finally
     freeandnil(iTab);
     freeandnil(ilay);
   end;
end;

procedure Tfrm_ev.Dbmemo1Exit(Sender: TObject);
begin
  inherited;
   If iEvento <> nil then
       iEvento.post;
end;

procedure Tfrm_ev.sp2Click(Sender: TObject);
begin
  inherited;
  if iEvento <> nil then
  begin
    if iEvento.State in [dsEdit,dsInsert] then
    begin
      iEvento.edit;
      iEvento.post ;
    end;
  end;
end;

procedure Tfrm_ev.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  self.AutoFecha := false;
  sp2Click(Self);
  self.AutoFecha := true;
end;

procedure Tfrm_ev.lb_cpoDblClick(Sender: TObject);
begin
  inherited;
    edit1.text := uppercase(' '+
                  tv_tab.Selected.text+'.'+
                  lb_cpo.cells[lb_cpo.col,lb_cpo.row]+' ');
    copia;
end;

procedure Tfrm_ev.copia;
begin
  edit1.selectall;
  edit1.CopyToClipboard;
  if wactive = nil then
   exit;
  ActiveControl := Wactive;
  if ACTIVECONTROL = Dbmemo2 then
     dbmemo2.PasteFromClipboard
  else
  if ACTIVECONTROL = Dbmemo1 then
     dbmemo1.PasteFromClipboard
  else
  if ActiveControl = Dbg_Lay then
  begin
    iLay.edit;
    ilay.fieldbyname('LAY_DE').asstring := edit1.text;
  end;
end;

procedure Tfrm_ev.dbmemo2Enter(Sender: TObject);
begin
  inherited;
  wactive := dbmemo2;
end;

procedure Tfrm_ev.Dbmemo1Enter(Sender: TObject);
begin
  inherited;
  wactive := dbmemo1;
  Dbg_Evento.DataSource.DataSet.edit;
end;

procedure Tfrm_ev.dbg_eventoEnter(Sender: TObject);
begin
  inherited;
  wactive := dbg_evento;
end;

procedure Tfrm_ev.dbg_layEnter(Sender: TObject);
begin
  inherited;
  wactive := dbg_lay;
end;

procedure Tfrm_ev.dbmemo2Click(Sender: TObject);
begin
  inherited;
  dbmemo2Enter(self);
end;

procedure Tfrm_ev.Dbmemo1Click(Sender: TObject);
begin
  inherited;
   Dbmemo1Enter(self);
end;

procedure Tfrm_ev.TV_tabDblClick(Sender: TObject);
begin
  inherited;
   // Se o quadro está vazio, não há o que fazer.
   if TV_tab.Items.Count = 0 then
     exit;

    edit1.text := uppercase(' '+tv_tab.Selected.text+' ');
    edit1.selectall;
    edit1.CopyToClipboard;
    ActiveControl := Wactive;
    if ACTIVECONTROL = Dbmemo2 then
       dbmemo2.PasteFromClipboard
    else
    if ACTIVECONTROL = Dbmemo1 then
       dbmemo1.PasteFromClipboard ;
end;

procedure Tfrm_ev.DBGrid1TitleClick(Column: TColumn);
var
  i : integer;
begin
 // inherited;
 if itab <> nil then
  Begin
     with iTab.fClient.IndexDefs do
      begin
        i := IndexOf(column.FieldName);
        If i < 0 then
          add(column.FieldName,column.FieldName,[]);
        iTab.fclient.IndexName := column.FieldName;
        iTab.fclient.First;
      end;
  end;

end;

procedure Tfrm_ev.dbg_dgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (shift = ([ssCtrl])) and (key = VK_DELETE) then
   Raise exception.create(mens54);
end;

procedure Tfrm_ev.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edit1.text := uppercase(' '+
                  tv_tab.Selected.text+'.'+
                  dbgrid1.DataSource.DataSet.fieldbyname('IDF_DESIGNACAO').asstring+' ');
  copia;                
end;

procedure Tfrm_ev.sp6Click(Sender: TObject);
begin
  inherited;
  If frm_main.ULT_DIR <> '' then
   od.InitialDir := frm_main.ULT_DIR
  else
   od.InitialDir := getcurrentdir;
  If dbedit1.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit1.DataSource.DataSet.edit;
       dbedit1.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit1.text,'');

   end;
  If dbedit1.Text <> '' then
    begin
      frm_main.ult_dir := extractFileDir(dbedit1.Text);

    end;

end;

procedure Tfrm_ev.sptelClick(Sender: TObject);
begin
  inherited;
  If frm_main.ULT_DIR <> '' then
   od.InitialDir := frm_main.ULT_DIR
  else
   od.InitialDir := getcurrentdir;
  If dbedit3.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit3.DataSource.DataSet.edit;
       dbedit3.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit3.text,'');

   end;
  If dbedit3.Text <> '' then
    begin
      frm_main.ult_dir := extractFileDir(dbedit3.Text);

    end;
end;

procedure Tfrm_ev.sp_altClick(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'TI_REQ' ;
       ListaTit := def18;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       Listafecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
        Cria_Correlacao(Cliente,Cenario,TIPO,self.Id,'EV',ListaCodigo,' ',0,0);
       Close;
       free;
     end;
end;

procedure Tfrm_ev.SpeedButton97Click(Sender: TObject);
begin
  inherited;
  frm_treeativ.spb_sqlClick(nil);
end;

procedure Tfrm_ev.Loadconstantobj;
var
  i : integer;

begin
 // Caption := 'frm_ev'   ;
 // SpeedButton97.Hint := 'SQL' ;
  //SpeedButton97.Caption := 'SQL'   ;
  SpeedButton17.Hint := def903;//'Salvar' ;
  GroupBox1.Caption := def62;//'Dados' ;
  Label7.Caption := def27;//'Tabelas'  ;
  Panel2. Caption := ' '    ;
  Label15.Caption := defa1;//'Atributos'  ;
  Label4.Caption :=   def10005;//'Nome'    ;
  Label6.Caption := def39 ;//'Especificação' ;
  Label11.Caption := defn2;//'Nome externo' ;
  SPP1.Hint := defd3;//'Diretórios'      ;
  sp6.Caption := defp6;//'Protótipo de Tela'  ;
  dbrg_cli.Caption := defd4;//'Distribuição'  ;
  dbrg_cli.items[0]  := defc11;//'Cliente'      ;
  dbrg_cli.items[1]  :=  def99;//'Servidor';   ;
 TabSheet2.Caption := def18 ;//'Eventos' ;
  Label9.Caption := def18 ;//'Evento'    ;
  Label10.Caption := def221;//'Método '   ;
  SpeedButton7.Caption := def102;//'Lista '   ;
  sp6.Caption := defp6;//'Protótipo de Tela'  ;
  SpeedButton1.Caption := def102;//'Lista   ' ;
  ts_lay.Caption := 'Lay Out'      ;
  Label12.Caption := defl2;//'Lay Out da tela'  ;
  PopupMenu3.Items[0].Caption := defe4;// 'Excluir  Correlação' ;
  DBG_LAY.Columns[1].Title.CAPTION := defa1;//'Atributo';
  DBG_LAY.Columns[2].Title.CAPTION :=  defc12;//'Consulta';
  DBG_LAY.Columns[3].Title.CAPTION := 'Edit';
  dbgrid1.Columns[0].Title.caption  := 'Seq';
  dbgrid1.Columns[1].Title.caption  := def10005;//'Nome';
  dbgrid1.Columns[2].Title.caption  := def1210;//'Tipo';
  dbgrid1.Columns[3].Title.caption  := def270;//'Tamanho';
  dbgrid1.Columns[4].Title.caption := 'PK';
end;

end.

