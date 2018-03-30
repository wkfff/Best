unit bst_telaObj;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask, Grids, DBGrids,
  Dialogs, ImgList, ToolWin,Activex, db, Menus, DBCtrls,
  cls_utils, dbtables, cls_obj, bstdb,adodb, AddFlow3Lib_TLB, fonctions,
  OleCtrls,bst_basefrm, ActnList, bst_objetos;

type
  Tfrm_obj = class(TBasefrm)
    Panel3: TPanel;
    sp2: TSpeedButton;
    sp_print: TSpeedButton;
    StandardToolBar: TToolBar;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    ToolButton1: TToolButton;
    spb_copy: TSpeedButton;
    spb_Paste: TSpeedButton;
    BitBtn1: TBitBtn;
    sp_insert: TSpeedButton;
    SP_X: TSpeedButton;
    //spb_del: TSpeedButton;
    fnt: TFontDialog;
    pgcp: TPageControl;
    tb_geral: TTabSheet;
    Tb_atv: TTabSheet;
    trv_atv: TTreeView;
    tb_dados: TTabSheet;
    lb1: TLabel;
    sLista1: TSpeedButton;
    lb2: TLabel;
    dbg_dg1: TDBGrid;
    db_desc: TDBMemo;
    tb_ger: TTabSheet;
    gb: TGroupBox;
    lb5: TLabel;
    lb4: TLabel;
    lb6: TLabel;
    dtp_data: TDateTimePicker;
    db_data: TDBEdit;
    db_versao: TDBEdit;
    db_resp: TDBEdit;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    EliminarElementodeDado1: TMenuItem;
    DBEdit6: TDBEdit;
    lv: TListView;
    SpeedButton5: TSpeedButton;
    OD: TOpenDialog;
    docext: TSpeedButton;
    DBEdit12: TDBEdit;
    dbg_dg: TDBGrid;
    sLista: TSpeedButton;
    MainMenu1: TMainMenu;
    gb_dom: TGroupBox;
    db_dom: TDBMemo;
    lb3: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Adicionar: TAction;
    Desfazer: TAction;
    Salvar: TAction;
    Excluir: TAction;
    Imprimir: TAction;
    Sair: TAction;
    procedure fChange(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure spb_PasteClick(Sender: TObject);
    procedure spb_copyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtp_dataCloseUp(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure sLista1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure dbg_dg1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spb_delClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EliminarElementodeDado1Click(Sender: TObject);
    procedure trv_atvDblClick(Sender: TObject);
    procedure lvDblClick(Sender: TObject);
    procedure docextClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    fDatasource: TdataSource;
    FTipo: string;
    FVisivel:string;
    FID: integer;
    FCliente: integer;
    FCenario: integer;
    FMode: string;
    FAutoFecha: boolean;
    FMemo_width: integer;
    FMemo_height: integer;
    Fmemo_left: integer;
    FMemo_top: integer;
    FDiretor: string;
    FArquivo: string;
    FiLink: afLink;
    FiNode: afNode;
    FFil: string;
    procedure Setidataset(const Value: TdataSource);
    procedure SetTipo(const Value: string);
    procedure SetVisivel(const Value: string);
    procedure SetCenario(const Value: integer);
    procedure SetCliente(const Value: integer);
    procedure SetID(const Value: integer);
    procedure SetMode(const Value: string);
    procedure SetAutoFecha(const Value: boolean);
    procedure memoDblClick(sender: Tobject);
    procedure SetMemo_height(const Value: integer);
    procedure SetMemo_width(const Value: integer);
    procedure Setmemo_left(const Value: integer);
    procedure SetMemo_top(const Value: integer);
    procedure AftPost(Dataset: Tdataset);
    procedure DePost(Dataset: Tdataset);
    procedure AftDel(Dataset: Tdataset);
    
    procedure SetDiretor(const Value: string);
    procedure SetArquivo(const Value: string);
    procedure fEnter(Sender: TObject);
    procedure SetiLink(const Value: afLink);
    procedure SetiNode(const Value: afNode);
    procedure TreeChg(Sender: TObject; Node: TTreeNode);
    procedure SetFil(const Value: string);
    procedure Eliminar(pTipo : integer);
    procedure Soleitura;

    { Private declarations }
  published
    procedure Mostra_dados;
    procedure Mostra_Dir(Sender: TObject);
    property idatasource : TdataSource read Fdatasource write Setidataset;
    property Tipo : string read FTipo write SetTipo;
    property Visivel : string read FVisivel write SetVisivel;
    property Cliente : integer read FCliente write SetCliente;
    property Cenario : integer read FCenario write SetCenario;
    property ID      : integer read FID write SetID;   // Id do objeto
    property Mode    : string read FMode write SetMode;  // se update ou insert
    property AutoFecha : boolean read FAutoFecha write SetAutoFecha;  //True, fecha quando confirma
    property Memo_width : integer read FMemo_width write SetMemo_width;
    property Memo_height: integer read FMemo_height write SetMemo_height;
    property Memo_top : integer read FMemo_top write SetMemo_top;
    property memo_left : integer read Fmemo_left write Setmemo_left;
    property Diretor : string read FDiretor write SetDiretor;
    property Arquivo : string read FArquivo write SetArquivo;
    property Fil : string read FFil write SetFil;
    property iLink : afLink read FiLink write SetiLink;
    property iNode : afNode read FiNode write SetiNode;
    procedure Loadconstantobjs;
  end;
var
  frm_obj : Tfrm_obj;
  Obj :Tdados_tab;
  iDe : Tdados_tab;
  iCodigo : integer;
implementation

uses  bst_main, bst_dir4, bst_ap, bst_juncao, bst_treeAtiv, bst_ev,bst_regra,
  bst_idiomas,bst_dm_rel, bst_de;

{$R *.DFM}

procedure Tfrm_obj.Mostra_Dir(Sender: TObject); // retorna diretorio e nome do arquivo
var
  iDir : tfrm_Dir4;
begin
  iDir := Tfrm_dir4.create(self);
  with iDir do
  begin
    showModal;
    Diretor := dl.Directory;
    Arquivo := edit2.text;
    Fil := iDir.fl.FileName;
  end;
end;

procedure Tfrm_obj.fChange(Sender: TObject);
begin
  sp2.enabled := true;
end;

procedure Tfrm_obj.fEnter(Sender: TObject);
begin
  idatasource.DataSet.edit;
end;

procedure Tfrm_obj.TreeChg(Sender: TObject; Node: TTreeNode);
begin
  fChange(sender);
end;


procedure Tfrm_obj.memoDblClick(sender : Tobject);
begin
  if  (sender as Tobject is TDBRichedit)  then
  begin
    if Memo_width > 0 then
    begin
      TDbRichEdit(sender as Tobject).width :=Memo_width  ;
      TDbRichEdit(sender as Tobject).height:=memo_height ;
      TDbRichEdit(sender as Tobject).top   :=memo_top ;
      TDbRichEdit(sender as Tobject).left  :=memo_left ;

      Memo_width :=  0;
      memo_height:=  0;
      Memo_Top   :=  0;
      Memo_Left  :=  0;
    end
    else
    begin
      Memo_width := TDbRichEdit(sender as Tobject).width;
      memo_height:= TDbRichEdit(sender as Tobject).height;
      Memo_Top   := TDbRichEdit(sender as Tobject).top;
      Memo_Left  := TDbRichEdit(sender as Tobject).Left;
      TDbRichEdit(sender as Tobject).BringToFront;
      TDbRichEdit(sender as Tobject).width     :=  (TDbRichEdit(sender as Tobject).Parent as TTabSheet).Width;
      TDbRichEdit(sender as Tobject).height    :=  (TDbRichEdit(sender as Tobject).Parent as TTabSheet).height;
      TDbRichEdit(sender as Tobject).top       :=  (TDbRichEdit(sender as Tobject).Parent as TTabSheet).top;
      TDbRichEdit(sender as Tobject).Left      :=  (TDbRichEdit(sender as Tobject).Parent as TTabSheet).Left;
    end;
  end;
end;

procedure Tfrm_obj.Setidataset(const Value: TdataSource);
begin
  Fdatasource := Value;
end;

procedure Tfrm_obj.sp2Click(Sender: TObject);
var
  str : string;
begin
  activeControl := nil;
  str := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString;
  if trim(str)  = '' then
  begin
    if frm_juncao <> nil then
    begin
      if frm_treeativ <> nil then
      begin
        if frm_juncao.dbrg.ItemIndex <> 0  then
          Raise exception.create(mens22);
      end;
    end
    else
      Raise exception.create(mens22);
    end
    else
    if frm_Treeativ <> nil then
    begin
      with  tv.Diagrama  do
      begin
        if SelectedLink <> nil then
        begin
          selectedlink.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString;
          if tv.Diagrama.SelectedNode <> nil then
          begin
            tv.Diagrama.SelectedNode.Tag  := 'IF';
            tv.Diagrama.SelectedNode.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString;
            tv.Diagrama.SelectedNode.UserData := idatasource.DataSet.fieldbyname('IDF_CODIGO').AsInteger;
          end;
        end
        else
        if selectedNode <> nil then
        begin
          if (uppercase(screen.ActiveForm.Name) <> 'FRM_AC') and (uppercase(screen.ActiveForm.Name) <> 'FRM_JUNCAO') then
          begin
            if (selectednode.Shape = 54) and (selectedNode.UserData = idatasource.DataSet.fieldbyname('IDF_CODIGO').asinteger) then //processo externo
                selectedNode.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString+#13+#13+
                   idatasource.DataSet.fieldbyname('IDF_WBS_CODE').AsString
            else
            begin
              if (uppercase(screen.ActiveForm.Name) = 'FRM_AP') and  (not selectednode.Shape in [50,79] ) then
               // O que fazer aqui ? um if sem o menor sentido.

              else
              if (uppercase(screen.ActiveForm.Name) = 'FRM_CS') then   //classes
                tv.Diagrama.Get_Title(tv.Diagrama.SelectedNode).Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString
              else
              begin
                if selectedNode.userdata = idatasource.DataSet.fieldbyname('IDF_CODIGO').asinteger then
                  selectedNode.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString ;
              end;
            end;
          end;
        end;
     end;
   end;

   with idataSource.DataSet do
    begin
       iDataSource.dataset.edit;
       idatasource.dataset.fieldbyname('usuario').asstring := oAcesso.nome;
       idatasource.dataset.fieldbyname('datatu').AsDateTime := date;
       iDataSource.dataset.post;
       //sp_insert.enabled := true;
       sp2.Enabled       := false;
    end;

   If self.AutoFecha then
      close;
   //spb_del.enabled := true;

end;

procedure Tfrm_obj.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure Tfrm_obj.SetVisivel(const Value:string);
begin
  FVisivel := Value;
end;


procedure Tfrm_obj.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
 // Ling(frm_main.Idioma,self); //idiomas

  for i := 0 to ComponentCount - 1 do      //aloca datasource do objeto corrente
   begin
    If Components[i] is TDbEdit then
       begin
         (Components[i] as TDbEdit).datasource := iDataSource ;
         (Components[i] as TDbEdit).OnChange   := fChange;
         If (Components[i] as TDbEdit).Field is TFloatField then
                (((Components[i] as TDbEdit).Field )As TFloatField ).DisplayFormat := '### ### ##0.00';
       end
    else
    If Components[i] is TDbGrid then
       begin
         If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
          (Components[i] as TDbGrid).Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit]
       end
    else
    If Components[i] is TDbRichEdit then
       begin
        // If  (Components[i] as TDbRichEdit).DataField <> '' then
         begin
           (Components[i] as TDbRichEdit).datasource := iDataSource ;
           (Components[i] as TDbRichEdit).OnChange   := fChange;
           (Components[i] as TDbRichEdit).OnEnter    := fEnter;
           (Components[i] as TDbRichEdit).OnDblClick := MemoDblClick;
           (Components[i] as TDbRichEdit).ScrollBars := ssvertical;
           (Components[i] as TDbRichEdit).BevelInner := bvLowered;
           (Components[i] as TDbRichEdit).BevelOuter := bvRaised;
           (Components[i] as TDbRichEdit).BevelKind  := bkSoft;
           If  (Components[i] as TDbRichEdit).Text = '' then
            Begin
               (Components[i] as TDbRichEdit).Font.Name  := 'Calibri';
               (Components[i] as TDbRichEdit).Font.Size  := 9;
            end;
         end;
       end
    else
    If Components[i] is TDbRadioGroup then
       begin
          (Components[i] as TDbRadioGroup).datasource := iDataSource;
          (Components[i] as TDbRadioGroup).OnChange := fChange;
       end
   else
   If Components[i] is TDbmemo then
       begin
          (Components[i] as TDbmemo).OnChange   := fChange;
          (Components[i] as TDBMemo).datasource := iDataSource;
          (Components[i] as TDbmemo).ScrollBars := ssvertical;
         (Components[i] as TDbmemo).BevelInner := bvLowered;
         (Components[i] as TDbmemo).BevelOuter := bvRaised;
         (Components[i] as TDbmemo).BevelKind  := bkSoft;
          If  (Components[i] as TDbmemo).Text = '' then
          Begin
             (Components[i] as TDbmemo).Font.Name  := 'Calibri';
             (Components[i] as TDbmemo).Font.Size  := 9;
          end;
       end
   else
   If Components[i] is TDbLookUpComboBox then
       begin
          (Components[i] as TDbLookUpComboBox).OnCloseUp  := fChange;
          (Components[i] as TDbLookUpComboBox).datasource := idataSource;
       end
   else
   If Components[i] is TTreeView then
       begin
          (Components[i] as TTreeView).OnChange   := TreeChg;
       end ;

   //sp2.enabled       := false;

  Id      := idatasource.DataSet.fieldbyname('IDF_CODIGO').asinteger;

  If frm_TreeAtiv <> nil then
     begin
       //sp_insert.enabled := false ;
       If tv.Diagrama.SelectedLink <> nil then
          iLink := tv.Diagrama.SelectedLink
       else
       If tv.Diagrama.SelectedNode <> nil then
          iNode := tv.Diagrama.SelectedNode ;
     end
     
  else
   begin
     If Mode = 'M' then
       //sp_insert.enabled := true
     else
       //sp_insert.enabled := false;
   end;
 end;
  pgcp.ActivePage := tb_geral;
 If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
  Begin
    SoLeitura;
  end;

end;


procedure Tfrm_obj.Soleitura;
begin
  sp_insert.visible := false;;
//    spb_del.Visible := false;
  sp_x.Visible := false;
  sp2.visible := false;
  standardToolBar.Visible := false;
  ToolButton4.Enabled := false;
  ToolButton5.Enabled := false;
end;

procedure Tfrm_obj.sp_insertClick(Sender: TObject);
var
  Wtab : string;
begin
    If tipo = 'OC' then
      Wtab := 'IDF_OI'
    else
       Wtab := 'IDF_'+tipo;
    obj := Tdados_tab.create(SELF);

    with obj  do
     begin
         with Tdg.create do
           Begin
             If Demomaior(Tipo,false) then
             Begin
                Raise exception.create(mens55+'('+Tipo+')');
                free;
                exit;
             end;
             free;
           end;

        If not Cria_Inst(Cliente,Cenario,0,Wtab,tipo,visivel,'',' ') then
           raise exception.create(ei4);    // cria registro com código   ....

        If not Open_Objeto(Cliente,Cenario,IDF_CODIGO,WTab) then  // .. e abre o mesmo
           raise exception.create(ei1);

        idataSource       := DataExt;
        formshow(self);
        sp2.enabled       := true;
     end;
end;

procedure Tfrm_obj.SetCenario(const Value: integer);
begin
  FCenario := Value;
end;

procedure Tfrm_obj.SetCliente(const Value: integer);
begin
  FCliente := Value;
end;

procedure Tfrm_obj.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure Tfrm_obj.BoldButtonClick(Sender: TObject);
begin
   xBold(self,BoldButton);
end;

procedure Tfrm_obj.ItalicButtonClick(Sender: TObject);
begin
  xItalic(self,ItalicButton);
end;

procedure Tfrm_obj.UnderlineButtonClick(Sender: TObject);
begin
  xUnderline(self,UnderlineButton);
end;

procedure Tfrm_obj.LeftAlignClick(Sender: TObject);
begin
  xAlign(self,Sender);
end;

procedure Tfrm_obj.BulletsButtonClick(Sender: TObject);
begin
  xBullet(self,BulletsButton);
end;

procedure Tfrm_obj.ToolButton1Click(Sender: TObject);
begin
  xFont(self,fnt);
end;

procedure Tfrm_obj.spb_PasteClick(Sender: TObject);
begin
  xPaste(self);
end;

procedure Tfrm_obj.spb_copyClick(Sender: TObject);
begin
  xcopy(self);
end;

procedure Tfrm_obj.FormCreate(Sender: TObject);
var
  i : integer;
begin
   pgcp.Brush.Color := $00F9F2F2;
   standardToolBar.Visible := true;

   If frm_TreeAtiv <> nil then
      begin
        Cliente := tv.Empresas.cenarios.CLI_ID;
        Cenario := tv.Empresas.cenarios.PRJ_ID;
        Id      := tv.Empresas.cenarios.Diagramas.Objeto.IDF_CODIGO;
      end
   else
      begin
        Cliente := CurrEmpresa.cenarios.CLI_ID;
        Cenario := CurrEmpresa.cenarios.PRJ_ID;
        Id      := CurrEmpresa.cenarios.Diagramas.Objeto.IDF_CODIGO;
      end;
  loadconstantObjs;
end;

procedure Tfrm_obj.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure Tfrm_obj.SetAutoFecha(const Value: boolean);
begin
  FAutoFecha := Value;
end;

procedure Tfrm_obj.SetMemo_height(const Value: integer);
begin
  FMemo_height := Value;
end;

procedure Tfrm_obj.SetMemo_width(const Value: integer);
begin
  FMemo_width := Value;
end;

procedure Tfrm_obj.Setmemo_left(const Value: integer);
begin
  Fmemo_left := Value;
end;

procedure Tfrm_obj.SetMemo_top(const Value: integer);
begin
  FMemo_top := Value;
end;

procedure Tfrm_obj.dtp_dataCloseUp(Sender: TObject);
begin
  idatasource.dataset.edit;
  db_data.field.text := formatdatetime('dd/mm/yyyy',dtp_data.date);
end;

procedure Tfrm_obj.pgcpChange(Sender: TObject);
var
  wcat,wdesc : string;
  ListItem : TListItem;
begin
   if pgcp.ActivePage = Tb_dados then // dados
   begin
     dbg_dg.Cursor := crHourGlass;
     Mostra_dados;
   end
   else
   if pgcp.ActivePage = Tb_Atv then // atividades
   begin
     //trv_atv.Items.Clear;
     lv.Items.Clear;
     lv.Columns[0].Caption := def63;
     lv.Columns[1].Caption := defe1  ;
     with Tdados_tab.create(self) do
     begin
       try
         Get_PaisCorrelatosBis(Cliente,cenario,'AP',Id,TIPO,'IDF_AP','ATOR_CATEGORIA','D') ;
         while not eof do
         begin
           { new(mObj);
           mObj^.Fcodigo := fieldbyname('IDF_CODIGO').asstring ;
           mObj^.fDesc   := fieldbyname('IDF_DESIGNACAO').asstring ;
           mObj^.fcat    := fieldbyname('ATOR_CATEGORIA').asstring ; }
           wcat := FormataCampo(trim(fieldbyname('ATOR_CATEGORIA').asstring),'B',15,'R');
           if trim(wcat) = 'Responsável' then
             wcat := def45
           else
             if trim(wcat) = 'Participante' then
               wcat := Def46
             else
               wcat := Def380;
             wdesc := FormataCampo(trim(fieldbyname('IDF_DESIGNACAO').asstring),'B',55,'R');
             //trv_ATV.Items.AddObject(nil,wdesc,mObj);

             ListItem := lv.items.add;
             ListItem.Caption := wdesc;
             ListItem.SubItems.Add(wcat);
             ListItem.SubItems.Add(fieldbyname('IDF_CODIGO').asstring);
             next;
         end;
         finally
           free;
         end;
       end;
    end ;
end;

procedure Tfrm_obj.Mostra_dados;
begin
  if Ide = nil then
    ide := Tdados_tab.Create(self);

    with iDe do
    begin
      try
        Get_Correlatos(Cliente,Cenario,TIPO,Id,'DE','IDF_DE');
        dbg_dg.DataSource    := dataext;
        db_Desc.DataSource   := dataext;
        db_Dom.DataSource    := dataext;
        db_Desc.dataField    := 'IDF_DESCRICAO';
        db_Dom.dataField     := 'IDF_DOMINIO';
        BeforePost           := DePost;
        AfterPost            := AftPost;
        AfterDelete          := AftDel;
      finally
        dbg_dg.cursor     := crDefault
      end;
    end;
end;

procedure Tfrm_obj.DePost(Dataset : Tdataset);
begin
   { TODO -c6-00-028 : Corrigido : atualização de elemento de dado }

  with Tdados_tab.create(self) do
  begin
    try
      CLI_ID := cliente;
      PRJ_ID := cenario;
      dbg_dg.DataSource.DataSet.fieldbyname('CLI_ID').Value := cliente;
      dbg_dg.DataSource.DataSet.fieldbyname('PRJ_ID').Value := cenario;
      dbg_dg.DataSource.DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').Value := 'DE';
      dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring := uppercase(dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring);

      if  (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'C') and
        (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'I') and
        (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'N') and
        (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'M') and
        (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'D') and
        (dbg_dg.DataSource.DataSet.fieldbyname('IDF_DATA_TYPE').asstring <> 'T') then
        Raise exception.create(mens98);
      if  dbg_dg.DataSource.DataSet.State = dsedit then
        exit;
      iCodigo := get_MaxKey('IDF_DE')+1;
      dbg_dg.DataSource.DataSet.fieldbyname('IDF_CODIGO').Value := iCodigo;
      finally
        free;
    end;
  end;
end;

procedure Tfrm_obj.AftPost(Dataset : Tdataset);
begin
  if iCodigo = 0 then
    exit;
  with Tdados_tab.Create(self) do
  begin
    try
      Cria_Correlacao(cliente,cenario,TIPO,iD,'DE',iCodigo,' ',0,0);
    finally
      free;
    end;
  end;
end;

procedure Tfrm_obj.AftDel(Dataset : Tdataset);
begin
  //  ide.Apaga_correlacao(cliente,cenario,TIPO,ID,'DE',
  //        dbg_dg.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger) ;
  //  pgcpChange(self);
end;

procedure Tfrm_obj.sLista1Click(Sender: TObject);
begin
  with Tdados_tab.create(self) do
  begin
    ListaCli := Cliente ;
    ListaProj:= Cenario ;
    ListaDim := 'IDF_DE' ;
    ListaTit := def26 ;
    ListaTag := 0 ;
    ListaEdit:= false ;
    ListaTree:= nil;
    ListaId  := 0;
    Listafecha:= true;
    mostra_lista;
    if ListaCodigo = 0 then
      exit;
    if not Cria_Correlacao(Cliente,Cenario,TIPO,self.Id,'DE',ListaCodigo,' ',0,0) then
      Raise exception.create(mens99);
    pgcpChange(self);
  end;
end;

procedure Tfrm_obj.Excluir1Click(Sender: TObject);
begin
  if MessageDlg(mens24, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ide.Apaga_correlacao(cliente,cenario,TIPO,ID,'DE', dbg_dg.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger);
    pgcpChange(self);
  end;
end;

procedure Tfrm_obj.dbg_dg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift = ([ssCtrl])) and (key = VK_DELETE) then
     eliminar(1);
end;

procedure Tfrm_obj.Eliminar(pTipo : integer);
begin
  if MessageDlg(mens23,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    raise exception.create(mens25);
  if pTipo = 2 then
  begin
    dbg_dg.Datasource.Dataset.edit;
    dbg_dg.DataSource.DataSet.Delete;
    dbg_dg.DataSource.DataSet.Post;
  end;
end;

procedure Tfrm_obj.SetDiretor(const Value: string);
begin
  FDiretor := Value;
end;

procedure Tfrm_obj.SetArquivo(const Value: string);
begin
  FArquivo := Value;
end;

procedure Tfrm_obj.spb_delClick(Sender: TObject);
begin
  //spb_del.enabled := false;
  ShowMessage('Aqui na Delecao');
end;

procedure Tfrm_obj.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 { If trim(idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString)  = '' then
       Raise exception.create(mens22);
 If frm_Treeativ <> nil then
   begin
    with  tv.Diagrama  do
     begin
        If SelectedLink <> nil then
           selectedlink.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString
        else
        If selectedNode <> nil then
          Begin
            If (uppercase(screen.ActiveForm.Name) <> 'FRM_AC') and (uppercase(screen.ActiveForm.Name) <> 'FRM_JUNCAO') then
              Begin
                If selectednode.Shape = 54 then //processo externo
                   selectedNode.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString+#13+#13+
                   idatasource.DataSet.fieldbyname('IDF_WBS_CODE').AsString
                ELSE
                 selectedNode.Text := idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').AsString
              end;
          end;
     end;
   end;  }

end;

procedure Tfrm_obj.SetiLink(const Value: afLink);
begin
  FiLink := Value;
end;

procedure Tfrm_obj.SetiNode(const Value: afNode);
begin
  FiNode := Value;
end;

procedure Tfrm_obj.SetFil(const Value: string);
begin
  FFil := Value;
end;

procedure Tfrm_obj.EliminarElementodeDado1Click(Sender: TObject);

begin
 eliminar(2);
end;

procedure Tfrm_obj.trv_atvDblClick(Sender: TObject);    { TODO -c6-00022-2 : Abertura da Atividade na tela de atividadde do Ator. }
var
iTab : TDados_tab;
begin
  inherited;
  { begin
   If trv_atv.selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

      If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_ATV.selected.Data)^.fcodigo),'IDF_AP') then
         raise exception.Create(EI1);
   end;
   If frm_ap   = nil then
      frm_ap := tfrm_ap.Create(self);
   frm_ap.Tipo        := 'AP';
   frm_ap.Visivel     := 'N';
   frm_ap.Mode        := 'M';
   frm_ap.AutoFecha   := true;
   frm_ap.idatasource := iTab.DataExt;
   frm_ap.showmodal;
   freeandnil(iTab);
  end;  }
end;

procedure Tfrm_obj.lvDblClick(Sender: TObject);
var
ListItem : TListItem;
iTab : TDados_tab;
begin
  begin
  If  Checa_Acesso(uppercase('frm_ap'),frm_main.SEGHABILIATADO,0) then
  begin
   If lv.Selected = nil then
      exit;
   Listitem := lv.Selected;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

   If not Open_Objeto(Cliente,Cenario,strtoint(ListItem.SubItems[1]),'IDF_AP') then
         raise exception.Create(EI1);
   end;
   If frm_ap   = nil then
      frm_ap := tfrm_ap.Create(self);
   frm_ap.Tipo        := 'AP';
   frm_ap.Visivel     := 'N';
   frm_ap.Mode        := 'M';
   frm_ap.AutoFecha   := true;
   frm_ap.idatasource := iTab.DataExt;
   frm_ap.showmodal;
   freeandnil(iTab);
  end;
  end;
  end;

procedure Tfrm_obj.docextClick(Sender: TObject);
begin
{  If dbedit12.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit12.DataSource.DataSet.edit;
       dbedit12.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit12.text,'');
   end;    }

   If frm_main.ULT_DIR <> '' then
   od.InitialDir := frm_main.ULT_DIR
  else
   od.InitialDir := getcurrentdir; 
  If dbedit12.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit12.DataSource.DataSet.edit;
       dbedit12.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit12.text,'');

   end;
  If dbedit12.Text <> '' then
    begin
      frm_main.ult_dir := extractFileDir(dbedit12.Text);

    end;
end;

procedure Tfrm_obj.Loadconstantobjs;
begin
      sp2.Caption := def903;//'Confirmar/Save' ;
      sp_print.Hint := def761;//'Imprimir Atividade' ;
      //sp_insert.Caption := def850;// 'Novo/New   ' ;
      //SP_X.Hint := 'Cancela' ;
      //SP_X.Caption := 'Desafazer/Undo';
      //spb_del.Caption := def84;//'Eliminar/Delete' ;
      spb_copy.Hint := def7778 ;//'Copiar ' ;
      spb_Paste.Hint := def510;//'Colar ';
      BoldButton.Hint := 'Bold'  ;
      BoldButton.Caption := 'BoldButton' ;
      ItalicButton.Hint := 'Italic'  ;
      ItalicButton.Caption := 'ItalicButton' ;
      UnderlineButton.Hint := 'Underline'  ;
      UnderlineButton.Caption := 'UnderlineButton';
      LeftAlign.Hint := 'Align Left'   ;
      LeftAlign.Caption := 'LeftAlign' ;
      CenterAlign.Hint := 'Center'  ;
      CenterAlign.Caption := 'CenterAlign'  ;
      RightAlign.Hint := 'Align Right' ;
      RightAlign.Caption := 'RightAlign' ;
      BulletsButton.Hint := 'Bullets|Enter bullet mode';
      BulletsButton.Caption := 'BulletsButton' ;
      //ToolButton1.Caption := 'ToolButton1' ;
      BitBtn1.Hint := def901;//'Sair' ;
      BitBtn1.Caption := def901;//'Sair' ;
      tb_geral.Caption :=def410;//'Geral/Main' ;
      //docext.Hint := 'Linkar com Documento extermo' ;
      docext.Caption := def550;//'Doc. externo/External Source' ;
      Tb_atv.Caption := def61;//'Atividades onde Aplicada/Involved Activities' ;
      tb_dados.Caption := def62;//'Dados/data';
      lb1.Caption := def26;//'Elementos de dados Associados/Data Elements' ;
      sLista.Caption := def102;//'Lista/List          ' ;
      lb2.Caption := def39;//'Descrição/Description' ;
      gb_dom.Caption := def55;//'Domínio/Domain' ;
      tb_ger.Caption := def78902;// 'Gerenciamento/Managing' ;
      gb.Caption := def78902;//'Gerenciamento/Managing' ;
      lb5.Caption := def6220;//'Data/Date'  ;
      lb4.Caption := def1220;//'Versão/Version' ;
      lb6.Caption := def45;//'Responsável/Responsible' ;


      //dbg_dg.Columns[1].title.Caption := def10005;//'Name'  ;
      //dbg_dg.Columns[2].title.Caption := def1221 ;//'titulo';
      //dbg_dg.Columns[3].title.Caption := def1210 ;//'Tipo/Type';
      If dbg_dg.Columns.count > 4 then
        Begin
             //dbg_dg.Columns[4].title.Caption := def270;//'Tamanho/Size';
             //dbg_dg.Columns[7].title.Caption :=  def1260 ;//'obrig';
             //dbg_dg.Columns[8].title.Caption :=   def220 ;//'mostra';
             // dbg_dg.Columns[9].title.Caption := def270;//'Default';
        end;
end;

procedure Tfrm_obj.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

