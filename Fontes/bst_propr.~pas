unit bst_propr;

interface

uses
  Windows, bst_Basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, AxCtrls, OleCtrls, AddFlow3Lib_TLB, Activex, 
  ExtCtrls, ComCtrls, cls_obj;

type
  Tfrm_propr = class(TBasefrm)
    cd_fundo: TColorDialog;
    pgc: TPageControl;
    TabSheet1: TTabSheet;
    tab_color: TTabSheet;
    rg_align: TRadioGroup;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabSheet4: TTabSheet;
    rg_estilo: TRadioGroup;
    rg_espessura: TRadioGroup;
    SpeedButton4: TSpeedButton;
    cd_fonte: TColorDialog;
    cd_borda: TColorDialog;
    Panel1: TPanel;
    Panel3: TPanel;
    fnt: TFontDialog;
    SpeedButton2: TSpeedButton;
    edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Aloca_font;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FClass_dg: string;
    procedure SetClass_dg(const Value: string);
    { Private declarations }
  public
    { Public declarations }
  published
     dg : Tdg;
     property Class_dg : string read FClass_dg write SetClass_dg;
     procedure LoadConstantObj;override;

  end;

var
  frm_propr: Tfrm_propr;
  Wfont : IFontDisp;
  Wfnt : Tfont;
  Wal : integer;
  bFont,bAlign,bFill,bDraw,bFore,bStyle,bWidth : boolean;

implementation

uses bst_main, bst_treeAtiv, bst_cfg;



{$R *.DFM}

procedure Tfrm_propr.SpeedButton1Click(Sender: TObject);
var
WFont :IFontDisp;
Wfont1 : Tfont ;
begin
   fnt.execute;
   Wfnt := fnt.font;
   Edit1.font := WFnt;
end;

procedure Tfrm_propr.Aloca_font;
var
WFont :IFontDisp;
Wfont1 : Tfont;
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   



end;

procedure Tfrm_propr.FormCreate(Sender: TObject);
var
Wi : variant;
begin
 
end;

procedure Tfrm_propr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_propr := nil;
  action := cafree;
end;

procedure Tfrm_propr.SpeedButton3Click(Sender: TObject);
begin
  cd_borda.execute;
  panel1.color := cd_borda.color;
end;

procedure Tfrm_propr.SpeedButton5Click(Sender: TObject);
begin
  cd_fundo.execute;
  panel3.color :=  cd_fundo.color;
end;

procedure Tfrm_propr.SpeedButton6Click(Sender: TObject);
begin
  cd_fonte.execute;
 // panel2.color := cd_fonte.color;
end;

procedure Tfrm_propr.SpeedButton2Click(Sender: TObject);
begin
  cd_fonte.execute;
  //panel4.color := cd_fonte.color;
end;

procedure Tfrm_propr.SpeedButton4Click(Sender: TObject);
var
Wtot,z,w,v : integer;
WFont :IFontDisp;
Wcolor : Tcolor;
Wbs,WAtor,WJunc,watrib,wmetodo,wtitulo : afNode;
Wpic : IpictureDisp;
Wpicture : Tpicture;
begin
   Wpicture := Tpicture.create;
   If frm_cfg <> nil then
    Begin
      begin
        GetOleFont(fnt.font,Wfont);
        Wcolor                       := fnt.font.Color;
        dgCfg.selectedNode.font      := Wfont;
        dgCfg.selectedNode.alignment := rg_align.itemIndex;
        dgCfg.selectedNode.FillColor := cd_Fundo.color;
        dgCfg.selectedNode.DrawColor := cd_borda.color;
        dgCfg.selectedNode.ForeColor := fnt.font.Color;  //cd_fonte.color;
        dgCfg.selectedNode.DrawStyle := rg_estilo.ItemIndex;
        dgCfg.selectedNode.DrawWidth := rg_espessura.ItemIndex;
        If dgcfg.IDG_DIR = 'CLS' then
        dgCfg.Apply_color(dgCfg.selectedNode) ;
      end;
    end
   else
   If frm_treeativ <> nil then
   begin
     Wtot := dg.selnodes.Count  ;
     for z := 1 to Wtot do
      begin
      If dg.SelNodes.item(z).shape = 50 then
      Begin
        wbs   := dg.Obtem_wbs(dg.SelNodes.item(z)) ;
        wator := dg.Obtem_ator(dg.SelNodes.item(z)) ;
      end
      else
      If ((dg.selnodes.Item(z).Shape = 1) and (tv.diagrama.idg_dir = 'CLS'))  then
       Begin
        wtitulo := dg.Get_Title(dg.SelNodes.item(z)) ;
        wAtrib := dg.Get_attributes(dg.SelNodes.item(z)) ;
        wMetodo:= dg.Get_Metodos(dg.SelNodes.item(z)) ;
       end;
      GetOleFont(fnt.font,Wfont);
      Wcolor                           := fnt.font.Color;
      dg.SelNodes.item(z).font      := Wfont;
      dg.SelNodes.item(z).alignment := rg_align.itemIndex;
      dg.SelNodes.item(z).FillColor := cd_Fundo.color;
      dg.SelNodes.item(z).DrawColor := cd_borda.color;

      dg.SelNodes.item(z).DrawStyle := rg_estilo.ItemIndex;
      dg.SelNodes.item(z).DrawWidth := rg_espessura.ItemIndex;
      If (frm_treeativ.oAtor <> nil) and (frm_treeativ.oWbs <> nil) then
      begin
        If wbs <> nil then
         Begin
            wbs.fillcolor                 := frm_treeativ.oWbs.FillColor;
            wbs.drawcolor                 := frm_treeativ.oWbs.DrawColor;
            wbs.DrawStyle                 := frm_treeativ.oWbs.DrawStyle;
            wbs.DrawWidth                 := frm_treeativ.oWbs.DrawWidth;
         end;
        If Wator <> nil then
         Begin
            wator.fillcolor               := frm_treeativ.oAtor.FillColor;
            wator.drawcolor               := frm_treeativ.oAtor.DrawColor;
            wator.DrawStyle               := frm_treeativ.oAtor.DrawStyle;
            wator.DrawWidth               := frm_treeativ.oAtor.DrawWidth;
         end;
      end;

      If Wtitulo <> nil then
       Begin
          Wtitulo.fillcolor        := cd_Fundo.color;
          Wtitulo.drawcolor        := cd_borda.color;
          Wtitulo.DrawStyle       := rg_estilo.ItemIndex;
          Wtitulo.DrawWidth       := rg_espessura.ItemIndex;
          wtitulo.font            := Wfont;
       end;
       If Watrib <> nil then
       Begin
          wAtrib.fillcolor        := cd_Fundo.color;
          wAtrib.drawcolor        := cd_borda.color;
          wAtrib.DrawStyle       := rg_estilo.ItemIndex;
          wAtrib.DrawWidth       := rg_espessura.ItemIndex;
          wAtrib.font            := Wfont;
       end;
       If WMetodo<> nil then
       Begin
          WMetodo.fillcolor        := cd_Fundo.color;
          WMetodo.drawcolor        := cd_borda.color;
          WMetodo.DrawStyle       := rg_estilo.ItemIndex;
          WMetodo.DrawWidth       := rg_espessura.ItemIndex;
          WMetodo.font            := Wfont;
       end;

      dg.SelNodes.item(z).ForeColor := fnt.font.Color;  //cd_fonte.color;


      If (dg.SelNodes.item(z).shape = 1) and (tv.Diagrama.IDG_DIR = 'DPN')then  //juncao
         begin
          begin
             WJunc := dg.obtem_junc(dg.SelNodes.item(z));
             If Wjunc <> nil then
             begin
             begin
              Wjunc.Drawstyle := dg.Wjufixo_Borda     ;
              Wjunc.Drawwidth := dg.Wjufixo_EspBorda     ;
              Wjunc.DrawColor := dg.Wjufixo_CorBorda     ;
              Wjunc.fillcolor := dg.Wjufixo_CorFundo     ;
              Wjunc.font      := dg.Wjufixo_fonte     ;
              Wjunc.forecolor := dg.Wjufixo_corfonte     ;
              Wjunc.width     := dg.Wjufixo_width     ;
              Wjunc.height    := dg.Wjufixo_height    ;
              for v := 1 to Wjunc.Outlinks.count do
               begin
                 If Wjunc.Outlinks.item(v).Linkstyle = 13  then
                    begin
                      Wjunc.Outlinks.item(v).dst.drawStyle := dg.Wjufixo_Borda     ;
                      Wjunc.Outlinks.item(v).dst.Drawwidth := dg.Wjufixo_EspBorda     ;
                      Wjunc.Outlinks.item(v).dst.DrawColor := dg.Wjufixo_CorBorda     ;
                      Wjunc.Outlinks.item(v).dst.fillcolor := dg.Wjufixo_CorFundo     ;
                      Wjunc.Outlinks.item(v).dst.font      := dg.Wjufixo_fonte     ;
                      Wjunc.Outlinks.item(v).dst.forecolor := dg.Wjufixo_corfonte     ;
                    end;
               end;
               dg.resize_rigid(Wjunc);
            end;
          end;
         end;
      end;

    end;

   end;
      { TODO : acresc 26/11/04 -> versào 36 }

   close;
end;

procedure Tfrm_propr.pgcChange(Sender: TObject);
var
Wfont1 : Tfont;
WFont : IFontDisp;
begin
  If pgc.ActivePage = tab_color then
     begin
       panel1.color := cd_borda.color;
       panel3.color := cd_Fundo.color;

        Wfont1                           := Tfont.create;
         If frm_cfg <> nil then
           Wfont                            := dgcfg.selNodes.Item(1).Font
        else
        If frm_treeativ <> nil then
           Wfont                            := dg.selNodes.Item(1).Font ;


        SetOleFont(Wfont1,Wfont);
        frm_propr.fnt.font               := wfont1;

        If frm_cfg <> nil then
           frm_propr.fnt.font.color         := dgcfg.selNodes.Item(1).ForeColor
        else
        If frm_treeativ <> nil then
            frm_propr.fnt.font.color         := dg.selNodes.Item(1).ForeColor ;
       ;

        frm_propr.Edit1.font             := WFont1;
        frm_propr.Edit1.font.color       := frm_propr.cd_fonte.color;
     end
end;

procedure Tfrm_propr.FormShow(Sender: TObject);
begin
  INHERITED;
  If frm_Treeativ <> nil then
     dg := tv.Diagrama;
end;

procedure Tfrm_propr.SetClass_dg(const Value: string);
begin
  FClass_dg := Value;
end;

procedure Tfrm_propr.LoadConstantObj;
begin
 INHERITED;

 Caption               := def91130;//'Propriedades' ;  
 SpeedButton4.Caption  := defa11;//'Aplicar'  ;
 rg_align.Caption      := defa12;//'Alinhamento'  ;
 rg_align.Items[0]     := defj1;//'Justificado a esquerda - topo'  ;
 rg_align.Items[1]     := defj2;//'Justificado a esquerda - meio' ;
 rg_align.Items[2]     := defj3;//'Justificado a esquerda - abaixo' ;
 rg_align.Items[3]     := defj4;//'Justificado a direita - topo' ;
 rg_align.Items[4]     := defj5;//'Justificado a direita - meio' ;
 rg_align.Items[5]     := defj6;//'Justificado a esquerda - abaixo' ;
 rg_align.Items[6]     := defc19;//'Centralizado - topo'     ;
 rg_align.Items[7]     := defc20;//'Centralizado - meio'     ;
 rg_align.Items[8]     := defc21;//'Centralizado - abaixo';
 //tab_color.Caption     := defc22;//'Cores'  ;
 //tabSheet1.Caption     := defa12;//'alinhamento'  ;
 SpeedButton3.Caption  := defc23;//'Cor da Borda'  ;
 SpeedButton5.Caption  := defc24;//'Cor do Fundo'   ;
 SpeedButton2.Caption  := deff3;//'Fonte' ;
 edit1.Text            := deff4;//'Fonte atual'  ;
 //TabSheet4.Caption     := defe13;//'Estilos'  ;
 rg_estilo.Caption     := defe14;//'Estilos da Borda'  ;
 //rg_estilo.items[0]    := defc25;//'Cheio ' ;
 //rg_estilo.items[1]    := deft6;//'Tracejado '   ;
 //rg_estilo.items[2]    := defp9;//'Pontilhado '   ;
 //rg_estilo.items[3]    := deft7;//'Traco-Ponto'  ;
 //rg_estilo.items[4]    := deft8;//'Traco-Ponto-Ponto ' ;
 //rg_estilo.items[5]    := deft9 ;//'Transparente';
 rg_espessura.Caption  := defe15;//'Espessura da Borda'  ;


end;

end.
