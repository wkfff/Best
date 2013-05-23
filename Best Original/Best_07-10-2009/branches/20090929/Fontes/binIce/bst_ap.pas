unit bst_ap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls,
  DBCtrls, Mask, ImgList, Buttons, ToolWin,bstdb,cls_obj,ADODb,dbTables,DB,
  Menus,QuickRpt, Qrctrls,cls_utils,AddFlow3Lib_TLB, gtQrCtrls,fonctions,
  gtQRXport_RTF,gtQRRtns,bst_pativ, OleCtrls,DBCLIENT,bst_basefrm, ActnList;

type
  Tfrm_ap = class(Tfrm_obj)
    Label18: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBRichEdit1: TDBRichEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBRG: TDBRadioGroup;
    TabSheet12: TTabSheet;
    GroupBox1: TGroupBox;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    DBEdit3: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit4: TEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBRichEdit6: TDBRichEdit;
    DBRichEdit7: TDBRichEdit;
    DBRichEdit8: TDBRichEdit;
    DBRadioGroup2: TDBRadioGroup;
    TabSheet5: TTabSheet;
    trv_local: TTreeView;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton12: TSpeedButton;
    TabSheet6: TTabSheet;
    trv_ator: TTreeView;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton14: TSpeedButton;
    TabSheet8: TTabSheet;
    trv_mec: TTreeView;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton13: TSpeedButton;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    DBRichEdit2: TDBRichEdit;
    Label12: TLabel;
    dbg_rn: TDBGrid;
    TabSheet4: TTabSheet;
    trv_regras: TTreeView;
    dbg_pg: TDBGrid;
    Label14: TLabel;
    DBRG1: TDBRadioGroup;
    Label15: TLabel;
    Label13: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label16: TLabel;
    Edit5: TEdit;
    spp1: TSpeedButton;
    dbl: TDBRichEdit;
    l7: TLabel;
    tb_evento: TTabSheet;
    TR_EN: TTreeView;
    Label17: TLabel;
    tb_dg: TTabSheet;
    trv_in: TTreeView;
    trv_out: TTreeView;
    Label19: TLabel;
    Label20: TLabel;
    cmb_cat: TComboBox;
    Label21: TLabel;
    trv_cat: TTreeView;
    Label23: TLabel;
    rdg_cat: TRadioGroup;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    LV1: TListView;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    Label27: TLabel;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    sb1: TSpeedButton;
    DBEdit4: TDBEdit;
    Label24: TLabel;
    Panel1: TPanel;
    Label11: TLabel;
    dbg_ap: TDBGrid;
    DBRichEdit4: TDBRichEdit;
    Label28: TLabel;
    sp_evento: TSpeedButton;
    sp_alt: TSpeedButton;
    dbg_ader: TDBGrid;
    sp6: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure Mostra_locais;
    procedure Mostra_regras ;
    procedure Mostra_Atores;
    procedure Mostra_sistemas;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Del_stdClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure dbg_apCellClick(Column: TColumn);
    procedure aderPost(dataset : Tdataset);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure trv_atorChange(Sender: TObject; Node: TTreeNode);
    procedure trv_localChange(Sender: TObject; Node: TTreeNode);
    procedure trv_mecChange(Sender: TObject; Node: TTreeNode);
    procedure trv_atorDblClick(Sender: TObject);
    procedure trv_regrasDblClick(Sender: TObject);
    procedure trv_localDblClick(Sender: TObject);
    procedure trv_mecDblClick(Sender: TObject);
    procedure sp_printClick(Sender: TObject);

    procedure sppClick(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure spgClick(Sender: TObject);
    procedure planilClick(Sender: TObject);
    procedure spp1Click(Sender: TObject);
    procedure trv_atvDblClick(Sender: TObject);
    procedure TR_ENDblClick(Sender: TObject);
    procedure LV1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBRGClick(Sender: TObject);
    procedure DBRG1Click(Sender: TObject);
    procedure trv_outDblClick(Sender: TObject);
    procedure BLERClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure dbg_apDblClick(Sender: TObject);
    procedure sp6Click(Sender: TObject);
    procedure DBRichEdit4Exit(Sender: TObject);
    procedure dbg_rnDblClick(Sender: TObject);
    procedure sp_eventoClick(Sender: TObject);
    procedure sp_altClick(Sender: TObject);
    procedure DBRichEdit1Click(Sender: TObject);
    procedure dblClick(Sender: TObject);
    procedure pgcpDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
  private
    FiLocal: Tdados_tab;
    FiRegra: Tdados_tab;
    FiAtor: Tdados_tab;
    FiFunc: Tdados_tab;
    FiEvento: Tdados_tab;
    FiReq: Treq;
    FAlterou_tipativ: boolean;
    procedure SetiAtor(const Value: Tdados_tab);
    procedure SetiEvento(const Value: Tdados_tab);
    procedure SetiFunc(const Value: Tdados_tab);
    procedure SetiLocal(const Value: Tdados_tab);
    procedure SetiRegra(const Value: Tdados_tab);
    procedure SetiReq(const Value: Treq);
    procedure SetAlterou_tipativ(const Value: boolean);
    procedure Mostra_fluxodados(pcodigo: integer);
    procedure Mostra_regra(pCli, pProj, pId: integer);
    



    { Private declarations }
  public
    { Public declarations }
  procedure Mostra_pap(pTipo : string; pForm : Tfrm_pativ);
  procedure Mostra_TI;
  procedure Check_Procedural;
  property  iAtor :  Tdados_tab read FiAtor write SetiAtor;
  property  iEvento :  Tdados_tab read FiEvento write SetiEvento;
  property  iFunc :  Tdados_tab read FiFunc write SetiFunc;
  property  iRegra :  Tdados_tab read FiRegra write SetiRegra;
  property  iLocal :  Tdados_tab read FiLocal write SetiLocal;
  property  iReq : Treq read FiReq write SetiReq;
  property  Alterou_tipativ : boolean read FAlterou_tipativ write SetAlterou_tipativ;
  procedure Loadconstantobj;override;
  end;

type
  uLst = ^TLst;
  TLst = record
    dstNode : afNode;
    lnk     : afLink;
    tipo    : char;
end;



var
  frm_ap: Tfrm_ap;
  iTab,iCorr ,iRn,iProd,iAder: Tdados_tab;
 //  ireq : Treq;
  wdef : integer;
  oObj : uObj;
  dbg_width,dbg_height,dbg_top,dbg_left,dbrich_top,Dbrich_height,dbgader_height,dbgader_top : integer;
  dbgap_height,dbgap_top : integer;
implementation

uses bst_main, bst_lista, bst_lf, bst_ca, bst_se, bst_treeAtiv,
  bst_regra,  bst_en, bst_data, bst_dm_rel;

{$R *.dfm}

procedure Tfrm_ap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   freeandnil(iTab);
  // freeandnil(iReq);
   freeandnil(iRn);
   freeandnil(iProd);
   freeandnil(iCorr);
   freeandnil(iAder);
   frm_ap  := nil;
   action := caFree;
end;

procedure Tfrm_ap.FormShow(Sender: TObject);
var
s : string;
wbscode : afNode;
begin
  inherited;
  tb_atv.TabVisible := false;
  tb_dados.TabVisible:= false;
     //activecontrol := dbedit2;
   activeControl := Dbedit2;
 //  dbedit1.DataSource.DataSet.Edit;
   If frm_Treeativ = nil then
    Begin
     If self.Mode <> 'I' then
      Begin
        dbrg.Enabled := false;
        dbrg1.Enabled := false;
      end;

    end
   else
    Begin
      If self.Mode = 'I' then
       Begin
         DbRg.ItemIndex := 0 ;
         DbRg1.ItemIndex := 1;
       end;
    end;

  If iDatasource.DataSet.FieldByName('IDF_TIPO_ATIV').asstring = '' then
     begin
       iDatasource.DataSet.edit;
       iDatasource.DataSet.FieldByName('IDF_TIPO_ATIV').asstring := 'AP' ;
     end;

  pgcp.ActivePage := tb_geral;
  If dbrg.ItemIndex = 0 then   //atividade
     begin
       Tabsheet8.tabvisible := false  ;
       Tabsheet2.tabvisible := false  ;
       spp1.visible := false;
     end
  else
     begin
       Tabsheet8.tabvisible := true  ;
       Tabsheet2.tabvisible := true  ;
       If frm_Treeativ <> nil then
       begin
         // entra direto nos requerimentos de TI   , qunado é diagrama Use case
          If tv.Diagrama.IDG_DIR = 'DUC' then
          begin
            {wbscode := tv.Diagrama.Obtem_wbs(tv.Diagrama.SelectedNode);

            If (idatasource.DataSet.fieldbyname('IDF_WBS_CODE').asstring <> '') then
              begin
                s :=  Tira_naonumerico(wbscode.Text );

                If  not IsNUmeric(s) then     // o box do diagrama mostra aplicativo  }
                 begin
                  pgcp.ActivePage := Tabsheet2;
                  pgcpChange(nil);
                 end;



          end;
        end;


       spp1.Visible := true;
     end;
  Alterou_TipAtiv := false;



end;

procedure Tfrm_ap.pgcpChange(Sender: TObject);
var
i ,j,wid,wtot: integer;
vList : TStringList;
wnode : afNode;
oNode : afNode;

mLst : uLst;
oList : TList;
dgx : TAddFlow;
iDg : Tdg;
wCusto_Tec : real;
oRec : TCusto;
mObj : uobj;
begin
  inherited;

  If pgcp.ActivePage = Tb_dg then   //dados
  begin
    dgx := TAddFlow.create(self);
    iDg :=  Tdg.create;
    trv_in.Items.clear;
    trv_out.Items.clear;
   try
     Begin
       If frm_TreeAtiv = nil then
         oNode := Localiza_fisico(self.Cliente,self.Cenario,Id,
                                iDatasource.DataSet.fieldbyname('IDG_ID').asinteger  ,'AP','DPN',dgx)
       else
         oNode := tv.Diagrama.SelectedNode;

      iDg.Get_Fluxos(trv_in,trv_out,oNode);
       {If oNode <> nil then
        Begin
           oList := Get_links(oNode,' ');
           for i := 0 to oList.Count-1 do
            Begin
              mLst := oList.Items[i];
              If trim(mLst^.lnk.Text) = '' then
               continue;
              If mLst^.tipo = 'I' then
                Begin
                 If InList(mLst^.lnk.Text,trv_in) then
                    continue;
                  new(mObj);
                  mObj.Fcodigo := inttostr(mLst^.lnk.userdata);
                  trv_In.Items.AddObject(nil,mLst^.lnk.Text,mObj)  ;

                end
              else
              If mLst^.tipo = 'O' then
                Begin
                 If InList(mLst^.lnk.Text,trv_Out) then
                    continue;
                 new(mObj);
                 mObj.Fcodigo := inttostr(mLst^.lnk.userdata);
                 trv_out.Items.AddObject(nil,mLst^.lnk.Text,mObj)  ;

                end;

            end;
        end; }
   end;
  finally
    If dgx <> nil then
      dgx.free;
    freeandnil(idg);
  end;

   end
  else

  If pgcp.ActivePage = Tb_evento then
  begin
     with Tdados_tab.create(self) do
       begin
          Get_Correlatos(Cliente,cenario,'AP',Id,'EN','IDF_EN') ;

          Cria_lista(tr_EN,false,true);
          free;
       end;
   end
  else


  If pgcp.ActivePage = TabSheet12 then
     Begin
      with Tcenario.create(self) do
       Begin
        open_cenario(self.Cliente,self.Cenario);
        edit4.Text := PRJ_PATH;
        edit1.Text := PRJ_PATROCINADOR;
        free;
       end;

     If dbrg1.ItemIndex = 0 then
      Begin

    //   dbedit4.ReadOnly  := true;
       dbedit5.ReadOnly  := true;
       dbedit7.ReadOnly  := true;
       groupBox4.Visible := false;
       groupBox1.Visible := false;
       DbRadioGroup2.Visible := false;
      end
     else
      Begin
       //dbedit4.ReadOnly := false;
       dbedit5.ReadOnly := false;
       dbedit7.ReadOnly := false;
       groupBox4.Visible := true;
       groupBox1.Visible := true;
       DbRadioGroup2.Visible := true;
      end ;

      //Custos unitários
     { If dbrg1.ItemIndex = 1 then    // procedural
       Begin
         with Tdados_tab.Create(self) do
           Begin
            oRec := Get_Custos_Ativ( self.Cliente,self.Cenario,Id,1,false);

            free;
           end;
            dbedit5.DataSource.DataSet.edit;
            dbedit5.Field.text := floattostr(oRec.Custo_Tec);
            dbedit4.Field.text := floattostr(oRec.Custo_mo);
            dbedit7.Field.text := floattostr(oRec.Custo_Outros);
       end; }

     end
  else
  If pgcp.ActivePage = TabSheet4 then
      Mostra_Regras
  else
  If pgcp.ActivePage = TabSheet5 then
       Mostra_Locais
  else
   If pgcp.ActivePage = TabSheet6 then
       Mostra_Atores
   else
   If pgcp.ActivePage = TabSheet8 then
       Mostra_Sistemas
   else
   If pgcp.ActivePage = TabSheet2 then // requerimentos de TI
     Mostra_TI;
end;

procedure TFrm_ap.Mostra_TI;
var
i ,j,wid,wtot: integer;
vList : TStringList;
wnode : afNode;
oNode : afNode;

mLst : uLst;
oList : TList;
dgx : TAddFlow;
iDg : Tdg;
wCusto_Tec : real;
oRec : TCusto;
mObj : uobj;
 begin

{ CRIA CORRELAÇÕES COM DG}

      If frm_treeativ <> nil then
       begin
         try
           iCorr := TDados_tab.Create(self);
           wnode := tv.Diagrama.SelectedNode ;

           for i := 1 to wnode.OutLinks.Count do
            begin
              If wnode.OutLinks.Item(i).Text <> '' then
                 iCorr.Cria_Correlacao(self.Cliente,self.Cenario,'AP',
                   tv.Diagrama.SelectedNode.UserData,'DG',wnode.OutLinks.Item(i).UserData,' ',0,0);
            end;

         finally
            freeandnil(iCorr);
         end;
       end;

      iReq:= Treq.create(self) ;
       with iReq  do
       begin
         ireq.CLIENTE := self.Cliente;
         iReq.CENARIO := self.Cenario;
         iReq.ID      := self.id;
         Get_ti ;
         dbg_ap.DataSource := iReq.DataExt  ;
         dbRichedit4.DataSource:= dbg_ap.DataSource;
         dbRichedit4.DataField := 'TI_ALTERNATE';
         If not ireq.eof then
           dbg_apCellClick(nil);
       end;

       {regras de negócio}
       iRn :=    Tdados_tab.create(self)  ;
       with iRn do
       begin
          iRn.Get_Correlatos(self.cliente,self.cenario,'AP',Id,'RN','IDF_RN') ;
          dbg_rn.DataSource := iRn.dataext;
       end;

       {produtos}
       iProd :=  Tdados_tab.create(self)  ;
       with iProd do
       begin
          iProd.Get_Correlatos(self.cliente,self.cenario,'AP',Id,'DG','IDF_DG') ;
          dbg_PG.DataSource := iProd.dataext;
       end;

 end;

procedure Tfrm_ap.Mostra_Locais;
Begin
  with Tdados_tab.create(self) do
   begin
      Get_Correlatos(Cliente,Cenario,'AP',Id,'LF','IDF_LF') ;
      Cria_lista(trv_Local,false,true);
   end;
 end;

procedure Tfrm_ap.Mostra_Regras;

Begin
  with Tdados_tab.create(self) do
   begin
      Get_Correlatos(Cliente,Cenario,'AP',Id,'RN','IDF_RN') ;
      Cria_lista(trv_regras,false,true);
   end;
end;


procedure Tfrm_ap.Mostra_Sistemas;
VAR
WCAT : STRING;
Begin
 with Tdados_tab.create(self) do
   begin
      TRV_MEC.Items.Clear;
      Get_Correlatos(Cliente,Cenario,'AP',Id,'SE','IDF_SE') ;
       while not eof do
       Begin
        new(mObj);
        mObj^.Fcodigo := fieldbyname('IDF_CODIGO').asstring ;
        mObj^.fDesc   := fieldbyname('IDF_DESIGNACAO').asstring ;
        mObj^.fnome    := fieldbyname('IDF_NOME').asstring ;
        wcat := FormataCampo(fieldbyname('IDF_NOME').asstring,'B',40,'R')+'  ';
        If trim(wcat) = '' then
         wcat := '';
        trv_MEC.Items.AddObject(nil,WCAT +fieldbyname('IDF_DESIGNACAO').asstring,mObj);

        next;
       end;
     // Cria_lista(trv_Mec,false,true);
   end;
end;

procedure Tfrm_ap.Mostra_Atores;
var
 wcat : string;
 ListItem : TListItem;
Begin
  with Tdados_tab.create(self) do
   begin
     // TRV_ATOR.Items.Clear;
      lv1.Items.Clear;
      lv1.Columns[0].Caption := Def1000;
      Get_CorrelatosBis(Cliente,Cenario,'AP',Id,'CA','IDF_CA','ATOR_CATEGORIA','D') ;
      while not eof do
       Begin

         ListItem := lv1.items.add;
         ListItem.Caption := fieldbyname('IDF_DESIGNACAO').asstring;
         wcat :=  fieldbyname('ATOR_CATEGORIA').asstring ;
         If trim(wcat) = 'Responsável' then
               wcat := def45
              else
         If trim(wcat )= 'Participante' then
               wcat := Def46
              else
               wcat := Def380;
         ListItem.SubItems.Add(wcat );
         ListItem.SubItems.Add(fieldbyname('IDF_CODIGO').asstring);
        next;
       end;

   end;


end;


procedure Tfrm_ap.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_ap.SpeedButton3Click(Sender: TObject);

begin
  inherited;

   with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_LF' ;
       ListaTit := Mensap1 ;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'LF',ListaCodigo,' ',0,0);
       Close;
     end;
   Mostra_locais;
end;

procedure Tfrm_ap.Del_stdClick(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_LF' ;
       ListaTit := Mensap1;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       If  trv_local.selected = nil then
           raise exception.create(mens11);
       ListaId  := strtoint(uObj(trv_Local.selected.Data)^.Fcodigo);

       If ListaId <> 0 then
          Apaga_Correlacao(Cliente,Cenario,'AP',self.Id,'LF',ListaId) ;
       
     end;
   Mostra_locais;
end;

procedure Tfrm_ap.SpeedButton2Click(Sender: TObject);
var
itab : Tdados_tab;
wid : integer;
begin
  inherited;
     iTab := Tdados_tab.create(self)  ;
     try
       with iTab do
         begin
           Tabela := 'IDF_LF';
           If frm_lf   = nil then
              frm_lf := tfrm_lf.Create(self);
           with frm_lf do
            begin
          //    ActiveControl := DBedit2;
              Tipo          := 'LF';
              Visivel       := 'N';
              Mode          := 'I';
              AutoFecha     := true;
              sp_Insertclick(frm_lf);
              wid := Obj.IDF_CODIGO;
              showModal;
            end;
         Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'LF',wid,' ',0,0);
         Mostra_locais;
         end;
     finally
        freeandnil(iTab);
     end;
end;

procedure Tfrm_ap.SpeedButton1Click(Sender: TObject);
var
itab : Tdados_tab;
wid : integer     ;
wcat : string;
begin
  inherited;

     


     iTab := Tdados_tab.create(self)  ;
     try
       with iTab do
         begin
           Tabela := 'IDF_CA';
           If frm_ca   = nil then
              frm_ca:= tfrm_ca.Create(self);
           with frm_ca do
            begin
              Tipo          := 'CA';
              Visivel       := 'N';
              Mode          := 'I';
              AutoFecha     := true;
              sp_Insertclick(frm_ca);
              wid := obj.IDF_CODIGO;
              showModal;

            end;
            If rdg_cat.itemindex = 0 then
             wcat := 'Responsável'
            else
            If rdg_cat.itemindex = 1 then
             wcat := 'Alternativo'
            else
             wcat := 'Participante' ;
            iTab.Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'CA',wid,wcat,0,0);
            activeControl := lv1;//trv_ator;
            Mostra_Atores;
         end;
     finally
        freeandnil(iTab);
     end;
end;

procedure Tfrm_ap.SpeedButton4Click(Sender: TObject);
var
wcat : string;
begin
  inherited;

  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_CA' ;
       ListaTit := Mensap3;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       If rdg_cat.itemindex = 0 then
             wcat := 'Responsável'
       else
       If rdg_cat.itemindex = 1 then
             wcat := 'Alternativo'
            else
             wcat := 'Participante' ;
       Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'CA',ListaCodigo,wcat,0,0);
       activeControl := lv1;
       Close;
     end;
   sp2.enabled := true;
   Mostra_Atores;
   idatasource.DataSet.edit;
   idatasource.DataSet.fieldbyname('idf_ator1').asstring :=  lv1.items[0].caption;//uObj(trv_ator.Items[0].Data)^.fDesc;
end;

procedure Tfrm_ap.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_SE' ;
       ListaTit := Mensap2;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;

       If ListaCodigo = 0 then
          exit;
       Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'SE',ListaCodigo,' ',0,0);
       Close;
     end;
   Mostra_sistemas;
end;

procedure Tfrm_ap.SpeedButton5Click(Sender: TObject);
var
itab : Tdados_tab;
wid : integer;
begin
  inherited;
     iTab := Tdados_tab.create(self)  ;
     try
       with iTab do
         begin
           Tabela := 'IDF_SE';
           If frm_SE   = nil then
              frm_SE:= tfrm_SE.Create(self);
           with frm_SE do
            begin
             // ActiveControl := DBedit2;
              Tipo          := 'SE';
              Visivel       := 'N';
              Mode          := 'I';
              AutoFecha     := true;
              sp_Insertclick(frm_SE);
              wId := Obj.IDF_CODIGO;
              showModal;
            end;
             Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'SE',wid,' ',0,0);
             Mostra_Sistemas;
         end;
     finally
        freeandnil(iTab);
     end;
end;

procedure Tfrm_ap.SpeedButton13Click(Sender: TObject);
var
ListItem : TListItem;
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_CA' ;
       ListaTit := Mensap3;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
     {  If  trv_ator.selected = nil then
           raise exception.create(mens11); }
       If lv1.Selected = nil then
           raise exception.create(mens11);
       ListItem := lv1.Selected;
       ListaId  := strtoint(ListItem.SubItems[1]);//(trv_ator.selected.Data)^.Fcodigo);

       If ListaId <> 0 then
          Apaga_Correlacao(Cliente,Cenario,'AP',self.Id,'CA',ListaId) ;

     end;
   Mostra_atores;
end;

procedure Tfrm_ap.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_SE' ;
       ListaTit := Mensap2;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       If  trv_Mec.selected = nil then
           raise exception.create(mens11);
       ListaId  := strtoint(uObj(trv_Mec.selected.Data)^.Fcodigo);

       If ListaId <> 0 then
          Apaga_Correlacao(Cliente,Cenario,'AP',self.Id,'SE',ListaId) ;
       
     end;
   Mostra_Sistemas;
end;
procedure Tfrm_ap.dbg_apCellClick(Column: TColumn);

begin
  inherited;
  //adrencia
  If iAder = nil then
      iAder := Tdados_tab.create(self);
  with iAder do
   begin
     abre_aderencia(cliente,cenario,dbg_ap.DataSource.DataSet.fieldbyname('IDF_CODIGO').AsInteger,
                      dbg_ap.DataSource.DataSet.fieldbyname('TI_CODIGO').asinteger);                     
     dbg_ader.DataSource := dataext;
     beforePost := AderPost;
   end;
 If dbg_ap.datasource <> nil then
 dbg_ap.DataSource.DataSet.Edit;

 {with tdados_Tab.create(self) do
  begin
   Abre_aderencia(cliente,cenario,dbg_ap.DataSource.DataSet.fieldbyname('IDF_CODIGO').AsInteger,
                   dbg_ap.DataSource.DataSet.fieldbyname('TI_CODIGO').asinteger);

   DBG_ader.DataSource := dataext;
 
  end;   }
end;

procedure Tfrm_ap.aderPost(dataset : Tdataset);
begin
  with dbg_ader.DataSource.DataSet  do
  begin
    edit;
    fieldbyName('cli_id').asinteger     :=  dbg_ap.DataSource.DataSet.fieldbyname('cli_id').asinteger;
    fieldbyName('prj_id').asinteger     :=  dbg_ap.DataSource.DataSet.fieldbyname('prj_id').asinteger;
    fieldbyName('idf_codigo').asinteger :=  dbg_ap.DataSource.DataSet.fieldbyname('idf_codigo').asinteger;
    fieldbyName('ti_codigo').asinteger  :=  dbg_ap.DataSource.DataSet.fieldbyname('ti_codigo').asinteger;
  end;
  
end;

procedure Tfrm_ap.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  dbrichedit7.visible :=not  dbrichedit7.visible;
end;

procedure Tfrm_ap.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  dbrichedit8.visible :=not  dbrichedit8.visible;
end;

procedure Tfrm_ap.sp2Click(Sender: TObject);
Var
Wpai_ant,WNivel_Ant,xid,i : integer;
Wnome_Ant,wClass : string;
Wtnode,wCurrentno : TtreeNode;
wNodeAtu,wCurrentNode,wbscode : afNode;
begin

//try
  If frm_treeativ <> nil then
   Begin
       If tv.Diagrama.SelectedNode = nil then
          Raise exception.create(mens11);
       If tv.Diagrama.IDG_DIR = 'DUC' then   //usecase
         begin
           dbrg.ItemIndex  := 1;
           dbrg1.ItemIndex := 1;

         end;

   end;
  If trim(Dbedit2.text) = '' then
     raise exception.create(mens22);

  If (dbrg.ItemIndex = -1) and (dbrg1.ItemIndex = -1 )then
   Begin
    dbrg.ItemIndex := 0;
    dbrg1.ItemIndex := 1;
   end
  else
  If dbrg.ItemIndex = 0 then
   Begin
     If (dbrg1.ItemIndex ) = -1 then
        dbrg1.ItemIndex  := 1
   end
  else
  If dbrg.ItemIndex = 1 then
   dbrg1.ItemIndex := 1 ;

  If Alterou_tipAtiv then
     Check_procedural;
  
   If frm_TreeAtiv <> nil then
    Begin
       If tv.Diagrama.SelectedNode = nil then
          Raise exception.create(mens11);
    end;


  sp2.enabled       := false;
  If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
   else
     //sp_insert.enabled := true;
  sp_x.enabled      := false;

  WClass := 'DPN';
  If frm_TreeAtiv <> nil then
     begin
       If Tv.Diagrama.SelectedNode.shape in [79,11,50] then
          begin
           If dbrg.field.TEXT = 'UC' then
            begin
              Rig_width  := Tv.Diagrama.SelectedNode.Width / 7;
              Rig_Height := Rig_Width ;;
              Rig_top    := Tv.Diagrama.SelectedNode.Top + Tv.Diagrama.SelectedNode.Height;
              Rig_Left   := (Tv.Diagrama.SelectedNode.Left + Tv.Diagrama.SelectedNode.Width) - Rig_width;
              tv.Diagrama.Cria_ducant(Tv.Diagrama.SelectedNode,false, 0,Rig_top,Rig_left,Rig_width,rig_height,12); // compatibilidade versoes anteriores
              Tv.Diagrama.Cria_duc( Tv.Diagrama.SelectedNode,True,0,Rig_top,Rig_left,Rig_width,rig_height,4);
              WClass := 'DUC';
           end
           else
              Tv.Diagrama.Cria_duc(Tv.Diagrama.SelectedNode,False,0,0,0,0,0,4) ;
           end;
           frm_treeativ.wuserdata := Tv.Diagrama.SelectedNode.UserData; // salva o código de atividade
          // Tv.Diagrama.SelectedNode.Text    := Dbedit2.Text;
           Tv.Diagrama.SelectedNode.ToolTip := dbrg.Values[dbrg.ItemIndex];
           If Tv.Diagrama.SelectedNode.shape in [79,11,50] then
              WtNode        := tv.get_filho(tv.selected,Id);
           //sp_insert.enabled := false;

     end;

         /// consistencias ator e local          (acrescentado use case na consistencia : 62
     If (frm_TreeAtiv <> nil ) and (Tv.Diagrama.SelectedNode.shape in [11,50,79,62]) or (frm_TreeAtiv = nil) then
        Begin
           with Tdados_tab.create(self) do
              Begin
               Get_CorrelatosBis(Cliente,Cenario,'AP',Id,'CA','IDF_CA','ATOR_CATEGORIA','D') ;
               If eof then
                  Begin
                     If frm_treeativ <> nil then
                        Begin
                          If frm_treeativ.atordef = 0 then  // ator não definido e sem default
                              Begin
                                //free;
                                Raise exception.create(mens64);
                              end
                          else
                              Begin
                               Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'CA',frm_treeativ.ATORDEF,'Responsável',0,0);
                               idatasource.DataSet.edit;
                               idatasource.DataSet.fieldbyname('idf_ator1').asstring := frm_TreeAtiv.atordefdesc;
                              end;
                        end
                     else
                      Begin
                       // free;
                        Raise exception.create(mens64);
                      end;
                  end ;


                  // local de processamento
                  Get_CorrelatosBis(Cliente,Cenario,'AP',Id,'LF','IDF_LF','','') ;
                  If eof then
                    Begin
                       If frm_treeativ <> nil then
                          Begin
                            If frm_treeativ.Localdef = 0 then  // local
                                begin
                                 // free;
                                  Raise exception.create(mens69);
                                end
                            else
                                Begin
                                 Cria_Correlacao(Cliente,Cenario,'AP',self.Id,'LF',frm_treeativ.LOCALDEF,'',0,0);
                              //   free;
                                end;
                          end
                       else
                        Begin
                         // free;
                          Raise exception.create(mens69);
                        end;
                    end;

              end;
        end;

        If frm_Treeativ <> nil then
         begin

           If Tv.Diagrama.SelectedNode.shape in [11,50] then
              begin

                      wbscode := tv.Diagrama.Obtem_wbs(tv.Diagrama.SelectedNode);

                      If wbscode.Text <> '' then
                        begin
                          s :=  Tira_naonumerico(wbscode.Text );
                          If  not IsNUmeric(s) then     // o box do diagrama mostra aplicativo
                            begin
                            // pgcpChange(nil);
                             with Tdados_tab.create(self) do
                               begin
                                 Get_Correlatos(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'AP',tv.Diagrama.SelectedNode.UserData,'SE','IDF_SE') ;
                                 xid := fieldbyname('IDF_COD_APLIC').asinteger ;
                                 Open_objeto( tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,xid,'IDF_TX');
                                 wbscode.text := fieldbyname('IDF_DESIGNACAO').asstring  ;
                                 free;
                               end ;
                            end
                          else
                            wbscode.Text := dbedit1.text;
                        end
                       else
                         wbscode.Text := dbedit1.text;

              end;

              // tv.Diagrama.Obtem_Wbs(Tv.Diagrama.SelectedNode).text := Dbedit1.text;

           If Tv.Diagrama.SelectedNode.shape in [11,50] then
              Begin
                 Mostra_Atores;
                 tv.Diagrama.Obtem_Ator(Tv.Diagrama.SelectedNode).text := lv1.items[0].cAPTION;//cuObj(trv_Ator.items[0].Data)^.fDesc   ;//trv_ator.Items[0].text;

              end;

           If (WTnode = nil) and (Tv.Diagrama.SelectedNode.shape in [79,11,50]) then        // nova atividade
             Begin
               If (dbrg.itemindex = 0) and (dbrg1.itemindex = 1) then
               else
                  Tv.Diagrama.Cria_Sub(Tv.Diagrama.SelectedNode,True);
               tv.Incluir_TVDiag(tv.selected,Cliente,Cenario,Id,Dbedit2.Text,wclass,true)  ;
             end
           else
           If (WTnode <> nil) and (Tv.Diagrama.SelectedNode.shape in [79,11,50]) then
             Begin
              If Dbedit2.text <> WtNode.text then
               Begin
                 Wtnode.Text :=Dbedit2.Text;
                 try
                   with Tdiag_dados.create(self) do
                    Begin
                     SUB_NOME := dbedit2.Text;
                     CLI_ID   := Cliente;
                     PRJ_ID   := Cenario;
                     IDG_ID   := udado(WtNode.Data)^.FDiag;
                     atualizar ;
                    // free;
                    end;
                 finally
                 end;
               end;
             end;

         end;


  inherited ;
  //cria correlações
  If frm_main.DECOMPOSTO then   // atividade recém-decomposta
   begin
     tv.diagrama.Criar_Correl_decomposto(tv.diagrama,tv.diagrama.selectednode);
   end;
  frm_main.DECOMPOSTO := false;
  close;
end;




procedure Tfrm_ap.trv_atorChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  sp2.enabled := true;
end;

procedure Tfrm_ap.trv_localChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  sp2.enabled := true;
end;

procedure Tfrm_ap.trv_mecChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  sp2.enabled := true;
end;

procedure Tfrm_ap.trv_atorDblClick(Sender: TObject);
var
iTab : TDados_tab;
begin
  inherited;
   begin
   If trv_ator.selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

  If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_ator.selected.Data)^.fcodigo),'IDF_CA') then
         raise exception.Create(EI1);
   end;
   If frm_ca   = nil then
      frm_ca := tfrm_ca.Create(self);
   frm_ca.Tipo        := 'CA';
   frm_ca.Visivel     := 'N';
   frm_ca.Mode        := 'M';
   frm_ca.AutoFecha   := true;
   frm_ca.idatasource := iTab.DataExt;
   frm_ca.Edit1.Text  := uobj(trv_ator.selected.Data)^.fcat;
   frm_ca.showmodal;
   freeandnil(itab);
  end;
end;

procedure Tfrm_ap.trv_regrasDblClick(Sender: TObject);
 begin
  If trv_Regras.Selected = nil then
      exit;
  Mostra_Regra(Cliente,Cenario,strtoint(uobj(trv_regras.selected.Data)^.fcodigo));

 end;

procedure Tfrm_ap.Mostra_regra(pCli,pProj,pId : integer);
var
iTab : Tdados_tab;
begin
  inherited;
   begin
  If  Checa_Acesso(uppercase('frm_ap'),frm_main.SEGHABILIATADO,0) then
  begin
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

     If not Open_Objeto(pCli,pProj,pId,'IDF_RN') then
         raise exception.Create(EI1);
   end;
   If frm_regra   = nil then
      frm_regra := tfrm_regra.Create(self);
   with frm_regra do
    begin
       Tipo        := 'RN';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := iTab.DataExt;
       showmodal;

    end;

  end;
  end;
end;

procedure Tfrm_ap.trv_localDblClick(Sender: TObject);
var
iTab : Tdados_tab;
begin
  inherited;
   begin
   If trv_local.Selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

     If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_local.selected.Data)^.fcodigo),'IDF_LF') then
         raise exception.Create(EI1);
   end;
   If frm_lf   = nil then
      frm_lf := tfrm_lf.Create(self);
   with frm_LF do
    begin
       Tipo        := 'LF';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := iTab.DataExt;
       showmodal;
    end;


  end;
end;


procedure Tfrm_ap.trv_mecDblClick(Sender: TObject);
var
iTab : Tdados_tab;
begin
  inherited;
   begin
   If trv_MEC.Selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

   If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_mec.selected.Data)^.fcodigo),'IDF_SE') then
         raise exception.Create(EI1);
   end;
   If frm_SE   = nil then
      frm_SE := tfrm_SE.Create(self);
   with frm_SE do
    begin
       Tipo        := 'SE';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := iTab.DataExt;
       showmodal;
    end;


  end;
end;

procedure Tfrm_ap.Mostra_pap(pTipo : string; pForm : Tfrm_pativ);
var

i : integer;
begin
  try
     with Tfrm_pAtiv(pForm) do
       begin
         //geral
         //qrp.Dataset := idataSource.dataset;
         //qrDataset(qr_main,idataSource.DataSet);
         //qrDataset(childband1,idataSource.DataSet);
         //qrDataset(QR_METR,idataSource.DataSet);
         // ator
         iator.Get_CorrelatosBis(Cliente,Cenario,'AP',Id,'CA','IDF_CA','ATOR_CATEGORIA','D') ;
         qr_ator.dataset := iAtor;
         qrDataset(qr_ator,iAtor);

         // EVENTO
         iEvento.Get_Correlatos(Cliente,Cenario,'AP',Id,'EN','IDF_EN') ;
         qr_evento.dataset := iEvento;
         qrDataset(qr_evento,iEvento);

         // funcionalidade
         iFunc.Get_Correlatos(Cliente,Cenario,'AP',Id,'SE','IDF_SE') ;
         qr_func.dataset := iFunc;
         qrDataset(qr_func,iFunc);

         // regras
         iRegra.Get_Correlatos(Cliente,Cenario,'AP',Id,'RN','IDF_RN') ;
         qr_regra.dataset := iRegra;
         qrDataset(qr_Regra,iRegra);

         // LOCAIS
         iLocal.Get_Correlatos(Cliente,Cenario,'AP',Id,'LF','IDF_LF') ;
         qr_Local.dataset := iLocal;
         qrDataset(qr_Local,iLocal);

         //TI
           with iReq  do
           begin
             ireq.CLIENTE := SELF.Cliente;
             iReq.CENARIO := self.Cenario;
             iReq.ID      := self.id;

             Get_ti ;
             qr_ti.dataset := iReq;
             qrDataset(qr_ti,iReq);
           end;

         If frm_treeativ = nil then
          begin
            //Tfrm_pAtiv(pForm).pr_cli.caption     := frm_main.lb_cli.caption;
            //Tfrm_pAtiv(pForm).pr_proj.caption    := frm_main.lb_cen.caption;

          end
         else
          begin
            //Tfrm_pAtiv(pForm).pr_cli.caption     := Get_NomCli(tv.selected);
            //Tfrm_pAtiv(pForm).pr_proj.caption    := Get_NomProj(tv.selected);
          end  ;

         //titulo.caption     := Mensap4;

        If pTipo = 'V' then
            //qrp.preview
         else
        If pTipo = 'P' then
            //qrp.print
        else
           //frm_Treeativ.ReportList.Add(TFRM_PATIV(pForm).QRP);
         //close;
       end;
  finally


  end;


end;



procedure Tfrm_ap.sp_printClick(Sender: TObject);
begin
  inherited;
  If frm_Treeativ <> nil then
     tv.Diagrama.Salvar;
  If frm_Pativ = nil then
      frm_Pativ := tfrm_Pativ.create(self);

    mostra_pap('V',frm_pativ);
  frm_pativ.close;
end;

procedure Tfrm_ap.sppClick(Sender: TObject);
begin
  inherited;

 // If (dbedit16.text = '') or (dbedit17.text = '') or (dbedit3.text = '') then
 //  Raise exception.create(mens47);
  If frm_treeativ <> nil then
     edit2.Text := floattostr( tv.empresas.cenarios.Diagramas.Objeto.Get_Lead)
  else
     edit2.Text := floattostr( frm_main.itab.Get_Lead);
end;




procedure Tfrm_ap.Check_Procedural;
var
iNode1,iAtu: TTreenode;
iNode2 : TTV;
iAtiv : integer;
iNo,iNoatu: afNode;
iDiag,iDiagAtu : Tdg;
tipoant : string;
begin
  inherited;
try
  {Na alteração de atividade para use case verificar :}
  try

     If (dbrg1.itemindex = 1) or ((dbrg.itemindex = 0) and (dbrg1.itemindex = 0))  then   // se nao p[rocedural, verica se ha filhhoss...`
     // If (dbrg1.itemindex = 0) then   // se nao procedural ou use case, verica se ha filhhoss...`
      Begin
       If frm_treeativ <> nil then  // verifica se a atividade já foi decomposta e esta com nivel abaixo preenchiudo
         begin
          iNoAtu := tv.Diagrama.SelectedNode;

          with ttv.create do
              begin
              iNode1 := get_filho(tv.Selected,ID);  //pega nó na árvore

              If iNode1 <> nil then     // o nó existe na árvore
                Begin
                   If Diagrama.IsEmpty(iNode1)  then   //.. se filho branco, deleta
                     begin
                       tv.Excluir_No(tv.Selected,iNode1,frm_ap);
                       tv.Items.Delete(iNode1);
                       tv.TvClick(self);
                       tv.Diagrama.cria_sub(Tv.Diagrama.SelectedNode,false);
                     end
                   else         //..filho nao é branco ....
                    Begin
                       // ...filho é DPN e é atividade procedural OU filho é DPN e é USE CASE = erro
                      If ((udado(iNode1.data)^.fClasse = 'DPN') AND (dbrg.itemindex = 0) AND (dbrg1.itemindex = 0)) or
                         ((udado(iNode1.data)^.fClasse = 'DUC') AND (dbrg.itemindex = 1))   then
                      else   
                         raise exception.Create(mens18);
                    end;
               end ;
             free;
             end;
         
         end;
      end;
  except
    raise;
  end;
finally
  
end;
end;

procedure Tfrm_ap.DBEdit16Exit(Sender: TObject);
begin
  inherited;
 // pgcpChange(self) ;
end;

procedure Tfrm_ap.DBEdit17Exit(Sender: TObject);
begin
  inherited;
  //pgcpChange(self) ;
end;

procedure Tfrm_ap.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  //pgcpChange(self) ;
end;

procedure Tfrm_ap.spgClick(Sender: TObject);
var
wList : TstringList;
i : integer;
iFlux : Tdados_tab;
begin
  inherited;
  If frm_treeativ <> nil then
   Begin
    edit3.Text := floattostr( tv.Diagrama.Get_Volume(tv.Diagrama.SelectedNode));
   end;
end;

procedure Tfrm_ap.planilClick(Sender: TObject);
begin
  inherited;
  bdx.Execute('SELECT * INTO REQUERIMENTOS '+ ' IN "C:\REQUER.XLS" "EXCEL 8.0;"  FROM TI_REQ');
end;

procedure Tfrm_ap.spp1Click(Sender: TObject);
begin
  inherited;
  If spp1.Tag = 1 then
   Begin
      wdef := DBRichEdit1.Width;
     // dbl.Text := DBRichEdit2.text;
      
      DBRichEdit1.width := (tb_geral.Width div 2) - 20 ;
      dbl.Width         := (tb_geral.Width div 2) - 20;
      dbl.height        := DBRichEdit1.height;
      dbl.Left := (tb_geral.Width div 2)+ 5 ;
      l7.left := dbl.left;
      dbl.visible := true;
      l7.Visible  := true;
      spp1.caption := Mensap5;
      spp1.Tag := 2   ;
      dblClick(nil);
      DBRichEdit1Click(nil)
   end
 else
   Begin
      dbl.Text := DBRichEdit2.text;
      DBRichEdit1.width := wdef;
      
      dbl.visible := false;
      l7.Visible  := false;
      spp1.caption := Mensap6;
      spp1.Tag := 1;
   end;
  
end;

procedure Tfrm_ap.trv_atvDblClick(Sender: TObject);
var
wcod : integer;
begin
  inherited;
mostra_Fluxodados(strtoint(uobj(trv_in.selected.Data)^.fcodigo));
end;
procedure Tfrm_ap.Mostra_fluxodados(pcodigo : integer);
var
wcod : integer;
begin
  inherited;
 { If TTreeview(sender as Tobject).selected = nil then
      wcod := uobj(TTreeview(sender as Tobject).selected.Data)^.fcodigo
   else }

   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

      If not Open_Objeto(Cliente,Cenario,pCodigo,'IDF_DG') then
         raise exception.Create(EI1);
   end;
   If frm_data   = nil then
      frm_data := tfrm_data.Create(self);
   frm_data.Tipo        := 'DG';
   frm_data.Visivel     := 'N';
   frm_data.Mode        := 'M';
   frm_data.AutoFecha   := true;
   frm_data.idatasource := iTab.DataExt;
   frm_data.showmodal;
   freeandnil(itab);

end;


procedure Tfrm_ap.TR_ENDblClick(Sender: TObject);
begin
  inherited;
   begin
   If tr_en.selected = nil then
      exit;


   If frm_en   = nil then
       frm_en := tfrm_en.Create(self);
     with frm_en do
      Begin
        If not iTab.Open_Objeto(Cliente,Cenario,strtoint(uobj(tr_en.selected.Data)^.fcodigo),'IDF_EN') then
           raise exception.Create(EI1);
         Tipo        := 'AP';
         Visivel     := 'N';
         Mode        := 'M';
         AutoFecha   := true;
         idatasource := iTab.DataExt;
         showmodal;
      end;

     
  end;;

end;

procedure Tfrm_ap.LV1DblClick(Sender: TObject);
var
ListItem : TListItem;
begin
  inherited;
   begin
   If lv1.selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   ListItem := lv1.Selected;
   with itab  do
   begin

  If not Open_Objeto(Cliente,Cenario,strtoint(ListItem.SubItems[1]),'IDF_CA') then
         raise exception.Create(EI1);
   end;
   If frm_ca   = nil then
      frm_ca := tfrm_ca.Create(self);
   frm_ca.Tipo        := 'CA';
   frm_ca.Visivel     := 'N';
   frm_ca.Mode        := 'M';
   frm_ca.AutoFecha   := true;
   frm_ca.idatasource := iTab.DataExt;
   frm_ca.Edit1.Text  := ListItem.SubItems[0];
   frm_ca.showmodal;
   freeandnil(itab);
  end;
end;

procedure Tfrm_ap.SetiAtor(const Value: Tdados_tab);
begin
  FiAtor := Value;
end;

procedure Tfrm_ap.SetiEvento(const Value: Tdados_tab);
begin
  FiEvento := Value;
end;

procedure Tfrm_ap.SetiFunc(const Value: Tdados_tab);
begin
  FiFunc := Value;
end;

procedure Tfrm_ap.SetiLocal(const Value: Tdados_tab);
begin
  FiLocal := Value;
end;

procedure Tfrm_ap.SetiRegra(const Value: Tdados_tab);
begin
  FiRegra := Value;
end;

procedure Tfrm_ap.SetiReq(const Value: Treq);
begin
  FiReq := Value;
end;

procedure Tfrm_ap.FormCreate(Sender: TObject);
begin
  inherited;
  iReq := Treq.Create(self);
  iAtor :=  TDados_tab.create(self);
  iEvento :=  TDados_tab.create(self);
  iFunc :=  TDados_tab.create(self);
  iRegra :=  TDados_tab.create(self);
  iLocal :=  TDados_tab.create(self);
  dbg_ap.Visible := False;
  DBRichEdit4.Visible := False;
  Label28.Visible := False;
  sp_alt.Visible := False;
  sp_evento.Visible := False;
  Label11.Visible := False;
  dbg_ader.Visible := False;

end;

procedure Tfrm_ap.DBRGClick(Sender: TObject);
var
tipoant : string;
begin
 Alterou_TipAtiv := true;
 If dbrg.ItemIndex = 0 then
    begin
      Tabsheet8.tabvisible := false  ;
      Tabsheet2.tabvisible := false  ;
      dbrg.DataSource.DataSet.edit;
      dbrg.Field.Text := 'AP';
      tipoant := 'UC';
      spp1.visible := false;
    end
   else
 If dbrg.ItemIndex = 1 then
    begin
      Tabsheet8.tabvisible := true  ;
      Tabsheet2.tabvisible := true ;
      dbrg.DataSource.DataSet.edit;
      dbrg.Field.Text := 'UC';
      tipoant := 'AP';
      spp1.visible := true;
    end;
end;

procedure Tfrm_ap.DBRG1Click(Sender: TObject);
begin
  // Check_Procedural;
end;

procedure Tfrm_ap.SetAlterou_tipativ(const Value: boolean);
begin
  FAlterou_tipativ := Value;
end;

procedure Tfrm_ap.trv_outDblClick(Sender: TObject);
begin
  inherited;
  mostra_Fluxodados(strtoint(uobj(trv_out.selected.Data)^.fcodigo));
end;

procedure Tfrm_ap.BLERClick(Sender: TObject);
begin
  inherited;
  iator.OpenAll(cliente,cenario,'IDF_CA','','',0);
 // iator.SaveToFile('C:\BUFFER\TEST',PFXML);
end;

procedure Tfrm_ap.sb1Click(Sender: TObject);
var
wseq,i : integer;
begin
  inherited;
  {with Tdados_tab.create(self) do
   begin
       Get_Correlatos(Cliente,Cenario,'AP',Id,'SE','IDF_SE') ;
       Open_objeto( Cliente,Cenario,fieldbyname('IDF_COD_APLIC').asinteger,'IDF_TX');
       If frm_treeativ <> nil then
        begin
         tv.Diagrama.Obtem_wbs(tv.Diagrama.SelectedNode).Text := fieldbyname('IDF_DESIGNACAO').asstring;

        end;
   end;  }


   If Dbrichedit2.lines.Count > 0 then
    begin
       wseq := 0;
       If not iReq.fClient.Eof then
         exit;
       for i := 0 to Dbrichedit2.lines.count -1 do
        begin
           wseq := wseq + 10;

            begin
             ireq.fClient.Insert;
             ireq.fClient.FieldByName('TI_SEQ' ).Value :=  wseq;
             iReq.fClient.FieldByName('TI_REQ_AP').value := trim(DbRichedit2.lines[i]);
             ireq.fClient.Post;

            end;

        end;
       

    end;

end;

procedure Tfrm_ap.dbg_apDblClick(Sender: TObject);
begin
  inherited;
  If  panel1.Top    = 0 then //Tabsheet2.top  then
   begin
    panel1.top    := dbg_top   ;
    panel1.height := dbg_height  ;
    panel1.Width  := dbg_width;

    dbrichedit4.Height := dbrich_height;
    dbg_ap.Height      := panel1.height;
    dbg_ader.Height    := dbg_ader.Height;
    dbg_ader.top       := dbgader_top;;
    dbg_ap.Height      := dbgap_Height;
    dbg_ap.top         := dbgap_top;;

   end
  else
   begin

    dbg_top       := panel1.top ;
    dbg_height    := panel1.height;
    dbg_width     := panel1.width;

    dbrich_height  := dbrichedit4.Height;
    dbgader_height := dbg_ader.Height;
    dbgader_top    := dbg_ader.top;
    dbgap_height   := dbg_ap.Height;
    dbgap_top      := dbg_ap.top;

    panel1.top    := 0;//Tabsheet2.top ;
    panel1.height := Tabsheet2.height;


    dbrichedit4.Height := (panel1.height - 50) - dbg_ader.Height ;
    dbg_ader.top       := dbrichedit4.top + dbrichedit4.Height;
    dbg_ap.Height      := dbrichedit4.height + dbg_ader.Height;
   end;
   panel1.bringtofront;

end;

procedure Tfrm_ap.sp6Click(Sender: TObject);
begin
  inherited;
  If frm_main.ULT_DIR <> '' then
   od.InitialDir := frm_main.ULT_DIR
  else
   od.InitialDir := getcurrentdir;
  If dbedit4.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit4.DataSource.DataSet.edit;
       dbedit4.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit4.text,'');
     
   end;
  If dbedit4.Text <> '' then
    begin
      frm_main.ult_dir := extractFileDir(dbedit4.Text);

    end;

  
end;

procedure Tfrm_ap.DBRichEdit4Exit(Sender: TObject);
begin
  inherited;
  DBRichEdit4.DataSource.DataSet.Post;
end;

procedure Tfrm_ap.dbg_rnDblClick(Sender: TObject);
begin
  inherited;
  Mostra_regra(dbg_rn.DataSource.DataSet.FieldByName('CLI_ID').asinteger,
               dbg_rn.DataSource.DataSet.FieldByName('PRJ_ID').asinteger,
               dbg_rn.DataSource.DataSet.FieldByName('IDF_CODIGO').asinteger );
end;

procedure Tfrm_ap.sp_eventoClick(Sender: TObject);

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
       with Treq.create(self) do
        begin
         Inclui(self.Cliente,self.Cenario,self.ID,ListaCodigo);
         free;
        end;
      // Cria_Correlacao(Cliente,Cenario,TIPO,self.Id,'EV',ListaCodigo,' ',0,0);
       Close;
       free;
       pgcp.ActivePage := Tabsheet2;
       pgcpChange(nil);
     end;
    
end;

procedure Tfrm_ap.sp_altClick(Sender: TObject);
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
       with Treq.create(self) do
        begin
         Inclui_Alt(self.Cliente,self.Cenario,self.ID,ListaCodigo);
         free;
        end;
      // Cria_Correlacao(Cliente,Cenario,TIPO,self.Id,'EV',ListaCodigo,' ',0,0);
       Close;
       free;
       pgcp.ActivePage := Tabsheet2;
       pgcpChange(nil);
     end;     
end;

procedure Tfrm_ap.DBRichEdit1Click(Sender: TObject);
var
a : integer;
begin
  inherited;

end;

procedure Tfrm_ap.Loadconstantobj;
begin

        Caption := def63;//'Atividade'  ;
       // tb_geral.Caption := 'WBS' ;
        Label6.Caption := def39;//'Descrição/Description';
        Label1.Caption := def10005;//'Designação/Name' ;
        spp1.Caption := def840;//'Exibir Objetivo do use Case/Show  Use case Obejctive';
        l7.Caption := def8888;//'Objetivo do use Case/Use Case Objective';
        docext.Caption := def550;//'Documento externo/External Source' ;
        DBRG.Caption := def9500;//'Tipo de Atividade/Activity Type' ;
        DBRG.Items[0] := DEF63;
        DBRG.Items[1] := def64;


      tb_evento.Caption := def2;//'Eventos de Negócio/Business Events' ;
      Label17.Caption := def2220 ;//'Eventos que Disparam Atividade/Events that trigger Activity' ;
      tb_atv.Caption := def61;//'Atividades onde Aplicada/Activites Involved' ;
      LV.Columns[0].Caption := DEF63;// ATIVIDADE
      LV.Columns[1].Caption := def10000;// ator envolvido
      LV1.Columns[0].Caption := DEF63;// ATIVIDADE
      LV1.Columns[1].Caption := def10000;// ator envolvido
      //speedbutton2.Caption := def102; //lista
      
     
      TabSheet12.Caption := DEF11231;//'Métrica/Metrics' ;
      Label4.Caption :=DEF11232;//'Mínimo' ;
      SpeedButton9.Caption := def6721 ;//'Pico' ;
    //  Label5.Caption := 'Período referencia' ;
      SpeedButton11.Caption := def6722 ;//'Regular' ;


      //Label15.Caption := 'Looping' ;
      GroupBox4.Caption := DEF1200;//'Tempos de Processamento (minutos)' ;
      Label7.Caption := DEF12000;//'Tempo de Processamento Unitário' ;
      Label8.Caption :=DEF12001;// 'Tempo de processamento Inativo' ;
      
      label10.Caption := def8821;//'Causa da Inatividade'  ;
    //  Label13.Caption := 'Lead Time'   ;
     // Label3.Caption := 'Volume'  ;
       GroupBox1.Caption := def1280 ;//'Volumes de Processamento (Anuais)'  ;
     // Label16.Caption := 'Total' ;

    //  Label9.Caption := 'Unidade de Tempo'   ;

      dbrg1.Caption  :=   def340   ;//atividade procedural
      dbrg1.Items[0] := def240     ;//nao
      dbrg1.Items[1] :=  def935   ;//sim 
      GroupBox3.Caption := def1045;//'Custos diretos' ;

      dbRadioGroup2.Caption := def1270 ;//'Utilidade';
      dbRadioGroup2.Items[0] := def1230   ;
      dbRadioGroup2.Items[1] :=def1240    ;
      dbRadioGroup2.Items[2] := def1250   ;
      dbRadioGroup2.Items[3] :=def1260    ;
      GroupBox2.Caption := def1044;//'Custos Rateados' ;
      Label25.Caption := def1041;//'Custo Tecnologia' ;
      Label26.Caption := def1050;//'Meio Ambiente'  ;
      Label22.Caption := def1042;//'Custo M.O'  ;
      Label27. Caption := def1043;//'Custo M.Prima'  ;
      TabSheet4.Caption := def5;//'Regras de Negócio/Business Rules'  ;
      Label24.Caption := def5;//'Regras de Negócio/Business Rules' ;
      TabSheet5.Caption := def48;// 'Locais de Processamento/Site'  ;
      //SpeedButton7.Caption := def102;//'Lista/List    '  ;
      SpeedButton8. Hint := def84;//'Eliminar registro' ;
      SpeedButton8.Caption := def84;//'Excluir/Delete  ';
      SpeedButton12.Caption := def850;//'Criar/New    ' ;
      TabSheet6.Caption := def1000;//'Atores/Actor'     ;
      SpeedButton3.Caption := def850;//'Criar    ' ;
      SpeedButton14.Hint := def84;//'Eliminar registro' ;
      SpeedButton14.Caption := def84;//'Excluir  '  ;
      //Label21.Caption := 'Categoria Ator' ;
     // Label23.Caption := def882;// 'Categoria'  ;



        rdg_cat.Caption := DEF883;//'Categoria Ator' ;
        RDG_cat.Items[0] := def450;//responsavel
        RDG_cat.Items[1] := def380;//Altenate
        RDG_cat.Items[2] := def46;//rParticipant

      

     TabSheet8.Caption := def112;//'Mecanismos/Softwares' ;
     SpeedButton1.Caption := def102;//lista   '  ;
     SpeedButton4.Caption := def850;//'Criar/New    '  ;
     SpeedButton13.Hint := def84;//'Eliminar registro' ;
     SpeedButton13.Caption := def84;//'Excluir/Delete' ;
     TabSheet2.Caption :=def37;// 'Requerimentos TI'  ;
     Label2.Caption := def8888;//'Objetivo do UC/UC Objective'  ;
     Label12.Caption := def67;//'Regra de negócio'    ;
     //Label14.Caption := 'Produtos Gerados'  ;
     sp6.Caption := def960;//'Tela/Form        '  ;


         DBG_ADER.Columns[0].Title.caption := DEF800;//VENDOR
         DBG_ADER.Columns[1].Title.caption := DEF10006;//AVALIAÇÃO
         DBG_ADER.Columns[2].Title.caption := DEF970;//ADERENCIA

    tb_dados .Caption := def62;//'Dados/Data' ;


      tb_dg.Caption := def9;//'Fluxos/Data Groups'  ;
      Label19. Caption :=def9000;// 'Fluxos Entrando/Input data Groups'  ;
      label20.Caption := def900;//'Fluxos Saindo/Output Data Groups' ;
      tb_ger.Caption := def78902;//'Gerenciamento/Control' ;


end;

procedure Tfrm_ap.dblClick(Sender: TObject);
var
a : integer;
begin


end;

procedure Tfrm_ap.pgcpDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  inherited;
  Control.Canvas.TextOut(Rect.left+1,Rect.top+3,pgcp.Pages[tabindex].Caption);
  pgcp.Pages[TabIndex].Font.Color:=Control.Canvas.Font.Color;
end;

end.


