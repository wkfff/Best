unit bst_cfg;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AxCtrls, OleCtrls, AddFlow3Lib_TLB, Buttons, ExtCtrls, Menus,
  Activex, StdCtrls, DBCtrls ,comctrls,cls_obj,bstdb, bst_dm_rel, ActnList,
  ImgList, ToolWin;
type
  Tfrm_cfg = class(TBaseFRm)
    Panel1: TPanel;
    PopNode: TPopupMenu;
    Propriedades1: TMenuItem;
    EntPop: TPopupMenu;
    Abrir1: TMenuItem;
    PopLink: TPopupMenu;
    Propriedades2: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    trv_class: TTreeView;
    spb_aplic: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ActionList1: TActionList;
    Salvar: TAction;
    Zoom: TAction;
    Aplicar: TAction;
    Sair: TAction;
    ImageList2: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Propriedades1Click(Sender: TObject);
    procedure Propriedades2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spb_aplicClick(Sender: TObject);
    procedure dgcfgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);

    procedure trv_classClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

  



var
  frm_cfg: Tfrm_cfg;
  wi : variant;
  Dg_Atu : string;
  Dgcfg : Tdg;
implementation

uses bst_main,  bst_treeAtiv, bst_propr, bst_proprlink;


{$R *.DFM}

procedure Tfrm_cfg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
freeandnil(dgcfg);
frm_cfg := nil;
action := cafree;


end;


procedure Tfrm_cfg.Propriedades1Click(Sender: TObject);
var
WFont :IFontDisp;
Wfont1 : Tfont ;
begin
  If dgcfg.SelectedNode = nil then
    exit;
  If frm_propr = nil then
     frm_propr := Tfrm_propr.Create(self);


  If dgcfg.selnodes. count = 0 then
     exit;                           // obtem as propriedades do template
  frm_propr.rg_Align.Itemindex      := DgCfg.selNodes.item(1).Alignment;
  frm_propr.rg_estilo.Itemindex     := DgCfg.selNodes.item(1).Drawstyle;
  frm_propr.cd_borda.color          := DgCfg.selNodes.Item(1).DrawColor;
  frm_propr.cd_fundo.color          := DgCfg.selNodes.Item(1).fillColor;
  frm_propr.cd_fonte.color          := DgCfg.selNodes.Item(1).ForeColor;
  Wi                                := DgCfg.selNodes.Item(1).DrawWidth  ;
  frm_propr.rg_espessura.Itemindex := Wi ;
  frm_propr.Panel1.color           := frm_propr.cd_borda.color;
  frm_propr.Panel3.color           := frm_propr.cd_fundo.color;
  Wfont1                           := Tfont.create;
  Wfont                            := DgCfg.selNodes.Item(1).Font;
  SetOleFont(Wfont1,Wfont);
  frm_propr.fnt.font               := wfont1;
  frm_propr.fnt.font.color         := DgCfg.selNodes.Item(1).ForeColor;
  frm_propr.Edit1.font             := WFont1;
  frm_propr.Edit1.font.color       := frm_propr.cd_fonte.color;
  frm_propr.showmodal;
end;

procedure Tfrm_cfg.Propriedades2Click(Sender: TObject);
begin
  //Dg_Corrente := DgCfg;
  If dgcfg.SelectedLink = nil then
   exit;
  If frm_ProprLink = nil then
      frm_proprLink := tfrm_ProprLink.Create(self);
  with frm_ProprLink do
   begin
      wfnt                      := Tfont.create;
      Wfont                     := dgcfg.SelLinks.item(1).font;
      setolefont(wfnt,Wfont);
      fnt.font                  := Wfnt;
      fnt.font.color            := dgcfg.SelLinks.item(1).ForeColor;
      edit4.font                := fnt.font;
      cd_fonte.color            := dgcfg.SelLinks.item(1).ForeColor;
      cd_borda.color            := dgcfg.SelLinks.item(1).DrawColor;
      panel2.color              := cd_Borda.color;
      wi                        := dgcfg.SelLinks.item(1).DrawWidth ;
      rg_espessura.ItemIndex    :=  wi ;
      rg_estilo.ItemIndex       :=  dgcfg.SelLinks.item(1).DrawStyle ;
      ck_org.Checked            := dgcfg.SelLinks.item(1).AdjustOrg ;
      ck_dst.Checked            := dgcfg.SelLinks.item(1).AdjustDst ;
      //edit1.text                := inttostr(dgcfg.SelLinks.item(1).ArrowOrg);
      edit2.text                := inttostr(dgcfg.SelLinks.item(1).ArrowMid);
      //edit3.text                := inttostr(dgcfg.SelLinks.item(1).ArrowDst);
      Classe_dg := wCodClass[trv_class.selected.Index +1];//uObj(trv_class.selected.data)^.fCodigo;
      If Classe_dg = 'DMI' then
       begin
          pgc.Pages[2].Tabvisible := true;
          pgc.Pages[1].Tabvisible := false ;
       end
      else
       begin
          pgc.Pages[2].Tabvisible := false;
          pgc.Pages[1].Tabvisible := true ;
       end   ;
      showModal;
    end;
   ;
end;

procedure Tfrm_cfg.SpeedButton1Click(Sender: TObject);
var
WCurDir : string;
Wlen : integer;
begin
  dgcfg.SaveFile(bdx.DirfLUXO + dg_atu);
  If frm_treeativ <> nil then
     tv.Diagrama.Salva_Atrib(wCodClass[trv_class.selected.Index +1]);
end;

procedure Tfrm_cfg.spb_aplicClick(Sender: TObject);
var
Wtot,i,m ,Wtlink: integer;
Wlink : afLink;
begin
   If tv.Diagrama <> nil then
      begin
      with tv.Diagrama do
      begin
        If tv.Diagrama.IDG_DIR <> wCodClass[trv_class.selected.Index +1] then
           raise exception.Create(mens38);
        Wtot := Nodes.Count;
        
        salva_atrib(wCodClass[trv_class.selected.Index +1]);
        for i := 1 to wtot do
        begin
          If nodes.Item(i).Selectable then
          Begin
            Atributos(nodes.item(i),2,wCodClass[trv_class.selected.Index +1]);

            Wtlink := nodes.item(i).links.count;
            If wtlink > 0 then
            begin
              for m := 1 to Wtlink do
              begin
                Wlink     := nodes.item(i).links.item(m);
                Atrib_link(Wlink,wCodClass[trv_class.selected.Index +1]);
              end;
          end;
          end;

        end;
       end;
     end;
end;

procedure Tfrm_cfg.dgcfgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
Ww,Wh : single;
begin

  If DgCfg.LastUserAction = afNodeResizing then
   begin
     dgcfg.Resize_Rigid(DgCfg.SelectedNode);
     Ww := DgCfg.SelectedNode.width ;
     Wh := DgCfg.SelectedNode.height;
   end;
 //  DgCfg.SelectedNode.ToolTip := floattostr(DgCfg.SelectedNode.height)+ 'x'+ floattostr(DgCfg.SelectedNode.width)

end;

procedure Tfrm_cfg.SpeedButton3Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_cfg.DBLookupComboBox1CloseUp(Sender: TObject);
var
Wlen ,i: integer;
WCurDir : string;
aWbs,aAtor : afNode;
begin

 try

     If  wCodClass[trv_Class.Selected.index+1] = 'LIV' then
       Begin
         dgcfg.LoadFile(Bdx.DirFluxo +'limpo.add');
         exit;
       end;


     dg_Atu := 'CFG'+ wCodClass[trv_Class.Selected.index+1]+'.ADD';
     If not fileexists(Bdx.DirFluxo+dg_atu) then
        raise exception.create(mens9);
     dgcfg.LoadFile(Bdx.DirFluxo +dg_atu);
     dgcfg.IDG_DIR  := wCodClass[trv_Class.Selected.index+1];
     If dgcfg.IDG_DIR = 'DPN' then
      Begin
     //   If frm_treeativ = nil then
           Begin
             for i := 1 to dgcfg.Nodes.Count  do
                Begin
                   If dgcfg.Nodes.Item(i).Shape = 50 then
                    Begin
                        aWbs:= dgcfg.Obtem_wbs(dgcfg.Nodes.Item(i));
                        dgcfg.WWbs_Prop_Width  := awbs.Width / dgcfg.Nodes.Item(i).Width;
                        dgcfg.WWbs_Prop_height := awbs.height / dgcfg.Nodes.Item(i).Height;
                        aAtor :=  dgcfg.Obtem_Ator(dgcfg.Nodes.Item(i));
                        dgcfg.WAtor_Prop_Width  := aAtor.Width / dgcfg.Nodes.Item(i).Width;
                        dgcfg.WAtor_Prop_height := aAtor.height / dgcfg.Nodes.Item(i).Height;
                    end;

                end;
           end;

      end;


 
 except
   raise;
 end;

end;

procedure Tfrm_cfg.Abrir1Click(Sender: TObject);
begin

  frm_propr.showModal;

end; 

procedure Tfrm_cfg.FormCreate(Sender: TObject);
var
i : integer;
begin
 try
  begin
     If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
        Begin
         spb_aplic.Visible  := false;
         SpeedButton1.Visible := false;
         ToolButton1.Enabled := false;
        end;
 
    dgcfg :=TDG.create;
    dgcfg.OnMouseUp := dgcfgMouseUp;
    //dgcfg.Carga_Atrib;
    insertControl(dgcfg);
    dgcfg.Width := 400;
    If frm_treeAtiv = nil then
      spb_aplic.enabled := false;
    for i := 1 to length(wCodClass) do
      trv_class.Items.Add(nil,wClass[i]);

  end;
 except
  begin
    raise;
  end;
 end;

end;



procedure Tfrm_cfg.SpeedButton8Click(Sender: TObject);
begin
  dgcfg.alinha(5);
  dgcfg.alinha(6);
end;


procedure Tfrm_cfg.trv_classClick(Sender: TObject);
begin
  DBLookupComboBox1CloseUp(frm_cfg);
  dgcfg.Salva_Atrib(wCodClass[trv_Class.Selected.index+1]);
  end;


procedure Tfrm_cfg.FormShow(Sender: TObject);
begin
  inherited;
  trv_class.selected := trv_class.Items[0];
  trv_classClick(frm_cfg);
  If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
  begin
    speedbutton1.Visible := false;
    ToolButton1.Enabled := false;
  end;
end;

procedure Tfrm_cfg.Loadconstantobj;
var
i : integer;

begin
  INHERITED;
  Caption := defc17;//'Configurações Padrão dos Objetos'  ;
  SpeedButton1.Hint := defs4 ;//'Salvar Configuração' ;
  spb_aplic.Caption := defA8;//'Aplicar ao Diagrama Corrente'  ;
  SpeedButton3.Hint := def901;//'Sair'  ;
  SpeedButton8.Hint := def1123 ;//'Mesmo Tamanho' ;
  
  PopNode.Items[0].Caption := def91130;//'Propriedades' ;
  PoplINK.Items[0].Caption := def91130;//'Propriedades' ;
  eNTpOP.Items[0].Caption := def91130;//'Propriedades' ;

  Abrir1.Caption := def91130;//'Propriedades' ;
  Propriedades2.Caption := def91130;//'Propriedades' ;
   
end;

end.

