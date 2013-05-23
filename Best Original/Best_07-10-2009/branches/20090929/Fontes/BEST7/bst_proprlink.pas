unit bst_proprlink;

interface

uses
  Windows, bst_BaseFrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,AxCtrls, OleCtrls,
  Activex, AddFlow3Lib_TLB,cls_obj, gtQrCtrls;

type
  Tfrm_proprlink = class(TBasefrm)
    pgc: TPageControl;
    tab_fonte: TTabSheet;
    tab_estilo: TTabSheet;
    SpeedButton1: TSpeedButton;
    cd_borda: TColorDialog;
    cd_fonte: TColorDialog;
    RadioGroup1: TRadioGroup;
    ck_org: TCheckBox;
    ck_dst: TCheckBox;
    rg_ponta: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    sp_org: TSpeedButton;
    sp_meio: TSpeedButton;
    sp_dst: TSpeedButton;
    rg_espessura: TRadioGroup;
    rg_estilo: TRadioGroup;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel2: TPanel;
    fnt: TFontDialog;
    Edit4: TEdit;
    TabSheet1: TTabSheet;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    sp_org_dmi: TSpeedButton;
    sp_dst_dmi: TSpeedButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    rdg1: TRadioGroup;
    Edit7: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure sp_orgClick(Sender: TObject);
    procedure sp_meioClick(Sender: TObject);
    procedure sp_dstClick(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure rg_pontaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FClasse_dg: string;
    procedure SetClasse_dg(const Value: string);
    procedure Check_default;
    
    { Private declarations }
  public
    { Public declarations }
  published
   dg : Tdg;
   property Classe_dg : string read FClasse_dg write SetClasse_dg;
   procedure Loadconstantobj;override;
  end;

var
  frm_proprlink: Tfrm_proprlink;
  Wfont : IFontDisp;
  Wfnt : Tfont;
implementation

uses bst_treeAtiv, bst_cfg, bst_main;



{$R *.DFM}

procedure Tfrm_proprlink.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_proprLink := nil;
  action := caFree;
end;

procedure Tfrm_proprlink.Check_default;
var
wi :  variant;
begin
  If frm_cfg <> nil then
   begin
      wfnt                      := Tfont.create;
      Wfont                     := Dgcfg.SelLinks.item(1).font;
      setolefont(wfnt,Wfont);
      fnt.font                  := Wfnt;
      fnt.font.color            := Dgcfg.SelLinks.item(1).ForeColor;
      edit4.font                := fnt.font;
      cd_fonte.color            := Dgcfg.SelLinks.item(1).ForeColor;
      cd_borda.color            := Dgcfg.SelLinks.item(1).DrawColor;
      panel2.color              := cd_Borda.color;
      wi                        := Dgcfg.SelLinks.item(1).DrawWidth ;
      rg_espessura.ItemIndex    :=  wi ;
      rg_estilo.ItemIndex       :=  Dgcfg.SelLinks.item(1).DrawStyle ;
      ck_org.Checked            := Dgcfg.SelLinks.item(1).AdjustOrg ;
      ck_dst.Checked            := Dgcfg.SelLinks.item(1).AdjustDst ;
      //edit1.text                := inttostr(Dgcfg.SelLinks.item(1).ArrowOrg);
      edit2.text                := inttostr(Dgcfg.SelLinks.item(1).ArrowMid);
      //edit3.text                := inttostr(Dgcfg.SelLinks.item(1).ArrowDst);
      //edit7.text                := edit1.text;
      //edit5.text                := edit3.text;
      exit;
   end   ;

  If frm_treeativ <> nil then
   begin

      dg := tv.Diagrama;
      wfnt                      := Tfont.create;
      Wfont                     := Dg.SelLinks.item(1).font;
      setolefont(wfnt,Wfont);
      fnt.font                  := Wfnt;
      fnt.font.color            := Dg.SelLinks.item(1).ForeColor;
      edit4.font                := fnt.font;
      cd_fonte.color            := Dg.SelLinks.item(1).ForeColor;
      cd_borda.color            := Dg.SelLinks.item(1).DrawColor;
      panel2.color              := cd_Borda.color;
      wi                        := Dg.SelLinks.item(1).DrawWidth ;
      rg_espessura.ItemIndex    :=  wi ;
      rg_estilo.ItemIndex       := Dg.SelLinks.item(1).DrawStyle ;
      ck_org.Checked            := Dg.SelLinks.item(1).AdjustOrg ;
      ck_dst.Checked            := Dg.SelLinks.item(1).AdjustDst ;
      //edit1.text                := inttostr(Dg.SelLinks.item(1).ArrowOrg);
      edit2.text                := inttostr(Dg.SelLinks.item(1).ArrowMid);
      //edit3.text                := inttostr(Dg.SelLinks.item(1).ArrowDst);
      //edit7.text                := edit1.text;
      //edit5.text                := edit3.text;
   end
 else
  

end;

procedure Tfrm_proprlink.SpeedButton1Click(Sender: TObject);
begin
  fnt.execute;
end;

procedure Tfrm_proprlink.SpeedButton2Click(Sender: TObject);
begin
  cd_fonte.execute;
end;

procedure Tfrm_proprlink.SpeedButton7Click(Sender: TObject);
begin
  cd_borda.execute;
  panel2.color := cd_Borda.color;
end;

procedure Tfrm_proprlink.SpeedButton6Click(Sender: TObject);
var
Wtot,z : integer;
WFont :IFontDisp;
Wcolor : Tcolor;
begin
  If frm_CFG <> nil then
   Begin
        GetOleFont(fnt.font,Wfont);
        Wcolor := fnt.font.Color;
        dgcfg.SelectedLink.font      := Wfont  ;
        dgcfg.SelectedLink.ForeColor := WColor;//cd_fonte.color;
        dgcfg.SelectedLink.DrawStyle := rg_estilo.ItemIndex;
        dgcfg.SelectedLink.DrawWidth := rg_espessura.ItemIndex;
        dgcfg.SelectedLink.DrawColor := cd_borda.color;

        dgcfg.SelectedLink.AdjustOrg := ck_org.Checked;
        dgcfg.SelectedLink.AdjustDst := ck_dst.Checked ;

        dgcfg.SelectedLink.ArrowOrg  := strtoint(edit1.text) ;
        dgcfg.SelectedLink.ArrowMid  := strtoint(edit2.text) ;
        dgcfg.SelectedLink.ArrowDst  := strtoint(edit3.text) ;
        If classe_dg = 'DMI'  then
           dgcfg.SelectedLink.Text := edit6.Text;
   end
  else
  If frm_Treeativ <> nil then
  begin
    Wtot := dg.selLinks.Count;
    for z := 1 to Wtot do
      begin
        GetOleFont(fnt.font,Wfont);
        Wcolor := fnt.font.Color;
        dg.SelLinks.item(z).font      := Wfont  ;
        dg.SelLinks.item(z).ForeColor := WColor;//cd_fonte.color;
        dg.SelLinks.item(z).DrawStyle := rg_estilo.ItemIndex;
        dg.SelLinks.item(z).DrawWidth := rg_espessura.ItemIndex;
        dg.SelLinks.item(z).DrawColor := cd_borda.color;

        dg.SelLinks.item(z).AdjustOrg := ck_org.Checked;
        dg.SelLinks.item(z).AdjustDst := ck_dst.Checked;

        if Edit5.Text = '0' then
        Begin
           Edit5.Text := Edit3.Text;
        End;
        If Edit7.Text = '0' then
        Begin
           Edit7.Text := Edit1.Text;
        End;
        dg.SelLinks.item(z).ArrowDst := StrToInt(edit5.Text);
        dg.SelLinks.item(z).ArrowOrg := StrToInt(edit7.Text);
        dg.SelLinks.item(z).ArrowMid := StrToInt(Edit2.Text);

        //dg.SelLinks.item(z).ArrowOrg  := strtoint(edit1.text) ;
        dg.SelLinks.item(z).ArrowMid  := strtoint(edit2.text) ;
        //dg.SelLinks.item(z).ArrowDst  := strtoint(edit3.text) ;
        //If classe_dg = 'DMI'  then
           //dg.SelLinks.item(z).Text := edit6.Text;
      end;
  end;
  close;
end;

procedure Tfrm_proprlink.sp_orgClick(Sender: TObject);
begin
  rg_ponta.ItemIndex := strtoint(edit1.text);
end;

procedure Tfrm_proprlink.sp_meioClick(Sender: TObject);
begin
  rg_ponta.ItemIndex := strtoint(edit2.text);
end;

procedure Tfrm_proprlink.sp_dstClick(Sender: TObject);
begin
  rg_ponta.ItemIndex := strtoint(edit3.text);
end;

procedure Tfrm_proprlink.pgcChange(Sender: TObject);
begin
  If pgc.ActivePage = tab_estilo then
  begin
    sp_org.down := true;
    rg_ponta.ItemIndex := strtoint(edit1.text);
  end;
end;

procedure Tfrm_proprlink.rg_pontaClick(Sender: TObject);
begin
   If Classe_dg = 'DMI' THEN
    begin
      If sp_org_dmi.down then
       begin
         case  rdg1.ItemIndex of
           0,1,2:  edit7.text := inttostr(rdg1.ItemIndex);
           3    : edit7.text := '15';
           4    : edit7.text := '16';
           5    : edit7.text := '17';
           6    : edit7.text := '18';
          // 7    : edit7.text := '19';
          end;
       end
      else
      If sp_dst_dmi.down then
       begin
         case  rdg1.ItemIndex of
           0,1,2:  edit5.text := inttostr(rdg1.ItemIndex);
           3    : edit5.text := '15';
           4    : edit5.text := '16';
           5    : edit5.text := '17';
           6    : edit5.text := '18';
           //7    : edit5.text := '19';
          end;
       end ;
      edit1.text := edit7.Text;
      edit3.Text := edit5.text;
      
    end
   else
    begin
      If sp_org.down then
      edit1.text := inttostr(rg_ponta.ItemIndex)
       else
       If sp_meio.down then
          edit2.text := inttostr(rg_ponta.ItemIndex)
       else
       If sp_dst.down then
          edit3.text := inttostr(rg_ponta.ItemIndex) ;
    end


end;

procedure Tfrm_proprlink.SetClasse_dg(const Value: string);
begin
  FClasse_dg := Value;
end;



procedure Tfrm_proprlink.FormShow(Sender: TObject);
begin
   inherited;
   Check_Default;
end;

procedure Tfrm_proprlink.Loadconstantobj;
  Begin
   inherited;

  Caption                  := defp14;//'Propriedades das setas'  ;
  SpeedButton6.Caption     := defa11;//'Aplicar'   ;
  //tab_fonte.Caption        := def80;//'Fonte';
  SpeedButton1. Caption    := def80;//'Fonte'  ;
  SpeedButton7.Caption     := defc28;//'Cor do Traço'  ;
  rg_espessura.Caption     := defe16;//'Espessura do Traço'  ;
  //rg_estilo.Caption        := deft11;//'Traço'  ;
  //rg_estilo.Items[0]       := defc25;// 'Cheio '           ;
  //rg_estilo.Items[1]       := deft6 ;//'Tracejado '           ;
  //rg_estilo.Items[2]       := deft7;//'Traço-Ponto'           ;
  //rg_estilo.Items[3]       := deft8;//'Traço-Ponto-Ponto '           ;
  //rg_estilo.Items[4]       := deft9;//'Transparente'            ;
  Edit4.Text               := deff4;//'Fonte Atual'    ;
  //tab_estilo.Caption       := defe13;//'Estilo' ;
  sp_org.Caption           := defs6;//'Seta Origem'  ;
  sp_meio.Caption          := defs7;//'Seta Meio'  ;
  sp_dst.Caption           := defs8;//'Seta Destino'  ;
  RadioGroup1.Caption      := defe17;//'Extremidades'  ;
  ck_org.Caption           := defp10;//'Permitir ajustar origem' ;
  ck_dst.Caption           := defp11;//'Permitir ajustar Destino'   ;
  rg_ponta.Caption         := deft10;//'Tipo de Seta'   ;
  rg_ponta.items[0]        := defs9;// 'Sem seta'                   ;
  rg_ponta.items[1]        := defc26;// 'Círculo Cheio'                   ;
  rg_ponta.items[2]        := defc27;// 'Círculo Vazio'                   ;
  rg_ponta.items[3]        := defs10;// 'Seta Cheia Pequena'                   ;
  rg_ponta.items[4]        := defs11;// 'Seta Vazia Pequena';
  rg_ponta.items[5]        := defs12;// 'Seta Cheia Média' ;
  rg_ponta.items[6]        := defs13;// 'Seta Vazia Média'  ;
  rg_ponta.items[7]        := defs14;// 'Seta Vazia Grande' ;
  rg_ponta.items[8]        := defs15;//'Seta Cheia Grande'  ;
  rg_ponta.items[9]        := defg2;//'Garfo Cheio'       ;
  rg_ponta.items[10]       := defg3;//'Garfo Vazio'    ;
  rg_ponta.items[11]       := defg4;//'Garfo Fechado Cheio'  ;
  rg_ponta.items[12]       := defg5;//'Garfo Fechado vazio'  ;
  rg_ponta.items[13]       := defl5;//'Losângulo Cheio' ;
  rg_ponta.items[14]       := defl6;//'Losângulo vazio'  ;
  rg_ponta.items[15]       := 'n'             ;
  rg_ponta.items[16]       := defn4;//'n opcional'  ;
  rg_ponta.items[17]       := '1'            ;
  rg_ponta.items[18]       := def1opt;//'1 Opcional'  ;
  rg_ponta.items[19]       := def12n;//'1 para n'  ;
  //TabSheet1.Caption        := defr4;//'Relacionamento'  ;
  sp_org_dmi.Caption       := defs6;//'Seta Origem'  ;
  sp_dst_dmi. Caption      := defs8;//'Seta Destino'  ;
  Caption                  := def39;//'Descrição'  ;
  RadioGroup2.Caption      := defe17;//'Extremidades'  ;
  CheckBox1.Caption        := defp10;//'Permitir ajustar origem'  ;
  CheckBox2. Caption       := defp11;//'Permitir ajustar Destino'  ;
  rdg1.Caption             := deft10;//'Tipo de Seta'  ;
  rdg1.items[0]            := defs9;//  'Sem seta'   ;
  rdg1.items[1]            := defc26;//  'Círculo Cheio'  ;
  rdg1.items[2]            := defc27;//  'Círculo Vazio'   ;
  rdg1.items[3]            :=   'n'            ;
  rdg1.items[4]            := defn4;//  'n opcional'   ;
  rdg1.items[5]            :=   '1'          ;
  rdg1.items[6]            :=  def1opt;// '1 Opcional';

       

end;

end.
