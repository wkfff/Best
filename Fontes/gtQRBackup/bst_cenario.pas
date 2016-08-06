unit bst_cenario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, FileCtrl, Grids, DBGrids,
  ExtCtrls, Mask, Buttons,bst_STDCAD, bstDB, gtQrCtrls, ImgList, ToolWin,cls_utils,
  fonctions, ActnList;

type
  Tfrm_cenario = class(Tfrm_stdcad)
    pgc: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet8: TTabSheet;
    pan_cli: TPanel;
    Label13: TLabel;
    SpeedButton11: TSpeedButton;
    Edit1: TEdit;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolbarImages: TImageList;
    fnt: TFontDialog;
    docext: TSpeedButton;
    OD: TOpenDialog;
    Edit6: TEdit;
    Panel2: TPanel;
    Label12: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit5: TEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Adicionar: TAction;
    Eliminar: TAction;
    Salvar: TAction;
    Sair: TAction;
    spdir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sp_novoClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure cmb2CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_cliChange(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Limpa_tela;
    procedure cmb_projChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure trv_ProjClick(Sender: TObject);
    procedure trv_cliClick(Sender: TObject);
    procedure sp_sairClick(Sender: TObject);
    procedure cmb_domCloseUp(Sender: TObject);
    procedure cmb_perCloseUp(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure spb_PasteClick(Sender: TObject);
    procedure spb_copyClick(Sender: TObject);
    procedure docextClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure spdirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  procedure LoadCOnstantObj;override;
  end;

var
  frm_cenario: Tfrm_cenario;
  iDom,iPer : TDominios;
implementation

uses bst_main, bst_treeAtiv, bst_demoassist, bst_dirCenario;


{$R *.DFM}

procedure Tfrm_cenario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If iDom <> nil then
     freeandnil(idom);
  If iPer <> nil then
     freeandnil(iper);
  frm_cenario := nil;
  action := caFree;
end;

procedure Tfrm_cenario.sp_novoClick(Sender: TObject);
var
WUltProj : integer;
begin
  inherited;
  try
  begin
    Limpa_tela;
   //trv_proj.Items.Clear;
    Scenario.Status :='I';
    Scenario.PRJ_ID := 0;
    sp_novo.enabled := false;
  end;
except
  begin
    raise;
  end;
end;


end;

procedure Tfrm_cenario.sp2Click(Sender: TObject);
begin
  inherited;

    If scenario.CLI_ID = 0  then
       raise exception.create(Mens84);
    If Edit2.text = '' then
       raise exception.create(Mens85);

    If Scenario.status = 'I' then
      begin
        with Scenario do
         begin
          PRJ_TITULO                    := edit2.Text;
          PRJ_OBJETIVO                  := richedit1.text;
          PRJ_PREMISSAS                 := richedit2.text;
          PRJ_CARATER_RELEVANTE         := richedit3.text;
          PRJ_FATORES_RESTRITIVOS       := richedit4.text;
          PRJ_DATA_INICIO               := '';
          PRJ_DATA_FIM_PLANEJADA        := '';
        //  PRJ_PATH                      := edit3.Text;
         // PRJ_PATROCINADOR              := edit4.Text;
          PRJ_CAMINHO                   := edit5.Text;
          IDF_DIRETORIO                 := edit6.text;
          criar(Scenario);
          status := 'M';
          sp_del.visible  := true;
          sp_novo.Visible := true;
          sp_novo.Enabled := true;
          If frm_TreeAtiv <> nil then
             tv.Incluir_No(tv.selected,Scenario.CLI_ID,Scenario.PRJ_ID
                       ,0,Scenario.PRJ_TITULO);
          //FormShow(frm_cenario);
            with empresas do
             begin
               cenarios.Open_Cenarios(CLI_ID);
             //  cenarios.Cria_lista(cmb_proj.items,prj_key.items,true);
             end;
         end;
      end
    else
    If Scenario.status = 'M' then
      begin
         with Scenario do
         begin
         // CLI_ID                        := strtoint(uObj(trv_cli.selected.Data)^.Fcodigo);
          PRJ_TITULO                    := edit2.Text;
          PRJ_OBJETIVO                  := richedit1.text;
          PRJ_PREMISSAS                 := richedit2.text;
          PRJ_CARATER_RELEVANTE         := richedit3.text;
          PRJ_FATORES_RESTRITIVOS       := richedit4.text;
          PRJ_DATA_INICIO               := '';
          PRJ_DATA_FIM_PLANEJADA        := '';
         // PRJ_PATH                      := edit3.Text;
         // PRJ_PATROCINADOR              := edit4.Text;
          PRJ_CAMINHO                   := edit5.Text;
          IDF_DIRETORIO                 := edit6.text;
          atualizar;
          sp_del.visible  := true;
          sp_novo.Visible := true;
          sp_novo.Enabled := true;
          If frm_TreeAtiv <> nil then
             tv.selected.Text := scenario.PRJ_TITULO;
         end;
      end;
 //  If Frm_Treeativ <> nil then
      close;
    If frm_main.wAssist then
     Begin
       frm_demoassist.cenario := scenario.prj_id;
       showmessage('O BEST vai mostrar agora o Cenário abaixo do Cliente na árvore de Diagramas!'#13+
                   'Após examinar a árvore, clique no X para fechar a árvore e voltar ao Assistente!');
     end;
end;

procedure Tfrm_cenario.cmb2CloseUp(Sender: TObject);
begin
  inherited;
  {try
  begin

    if MessageDlg('A alteração da unidade de tempo pode acarretar erros nas métricas! Continua ?',
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
       cmb2.Closeup(false);
       wchange ;
      end
     else
       cmb2.Closeup(true);

  end;
except
  begin
    raise;
  end;
end;  }

end;


procedure Tfrm_cenario.FormShow(Sender: TObject);
begin
  inherited;
  Idom :=  TDominios.create(self);
  iDom.Open_Dominio('TEM',frm_main.Idioma) ;
  //cmb_dom.ListSource := iDom.DataExt;
 // cmb_dom.ListField  := 'DI_DESCRICAO';
  //mb_dom.KeyField   := 'DI_DESCRICAO';


 //cmb_per.ListSource := iDom.DataExt;
 // cmb_per.ListField  := 'DI_DESCRICAO';
  //cmb_per.KeyField   := 'DI_DESCRICAO';

  Limpa_tela;
  If Scenario = nil then
     Scenario       := Tcenario.create(self);
  
  If Scenario.status = 'M' then
     begin
       If not scenario.Open_Cenario(scenario.CLI_ID,scenario.PRJ_ID) then
          raise exception.Create(EI1);
       If frm_TreeAtiv <> nil then
         edit1.Text           := tv.selected.Parent.Text;

       edit1.ReadOnly       := true;
       edit2.text           := scenario.PRJ_TITULO;
       edit6.text           := scenario.IDF_DIRETORIO;
       Richedit1.Text       := scenario.PRJ_OBJETIVO;
       Richedit2.Text       := scenario.PRJ_PREMISSAS ;
       Richedit3.Text       := scenario.PRJ_CARATER_RELEVANTE;
       Richedit4.Text       := scenario.PRJ_FATORES_RESTRITIVOS;
     //  edit3.Text           := scenario.PRJ_PATH;
      //edit4.Text           := scenario.PRJ_PATROCINADOR;
       edit5.Text           := scenario.PRJ_CAMINHO;
       speedButton1.Visible := false;
       speedButton2.Visible := false;
     end
  else
     begin
       If empresas = nil then
           empresas := Tempresa.create(self);
       empresas.Open_All;
      // empresas.Cria_lista(trv_cli,false,true);
     end;
 // If frm_main.wassist then
  //   memo1.Visible := true;
end;

procedure Tfrm_cenario.Limpa_tela;
begin
    
    If frm_TreeAtiv <> nil then
      Begin
       If tv.Selected.Level > 0 then
         edit1.Text := ' ';
      end;
     edit2.Text := ' ';
   // edit3.Text := ' ';
   // edit4.Text := ' ';
    edit5.Text := ' ';
    edit6.Text := ' ';
    richedit1.text :=  ' ';
    richedit2.text :=  ' ';
    richedit3.text :=  ' ';
    richedit4.text :=  ' ';
end;

procedure Tfrm_cenario.cmb_cliChange(Sender: TObject);
begin
  inherited;
  Limpa_tela;
 // empresas.Open_Empresa(strtoint(uObj(trv_cli.selected.Data)^.Fcodigo));
  edit1.Text := empresas.CLI_NOME;
  with empresas do
   begin
     cenarios.Open_Cenarios(CLI_ID);
    // cenarios.Cria_lista(trv_proj,false,true);
     cenarios.Status :='M';
   end;


end;

procedure Tfrm_cenario.Edit2Change(Sender: TObject);
begin
  inherited;
  sp2.enabled := true;
end;

procedure Tfrm_cenario.cmb_projChange(Sender: TObject);
begin
  inherited;
 // scenario.Open_Cenario(empresas.CLI_ID,strtoint(uObj(trv_proj.selected.Data)^.Fcodigo));
  edit2.text     := scenario.PRJ_TITULO ;
  //edit3.Text     := scenario.PRJ_PATH;
  //edit4.Text     := scenario.PRJ_PATROCINADOR;
  richedit1.text := scenario.PRJ_OBJETIVO  ;
  richedit2.text := scenario.PRJ_PREMISSAS ;
  richedit3.text := scenario.PRJ_CARATER_RELEVANTE ;
  richedit4.text := scenario.PRJ_FATORES_RESTRITIVOS  ;
  scenario.Status:= 'M'; 
end;

procedure Tfrm_cenario.SpeedButton1Click(Sender: TObject);
begin
  inherited;
 // trv_cli.Visible := not trv_cli.Visible;
end;

procedure Tfrm_cenario.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 // trv_proj.Visible := not trv_proj.Visible;
end;

procedure Tfrm_cenario.trv_ProjClick(Sender: TObject);
begin
  inherited;
 // trv_proj.Visible := false;
  cmb_projChange(frm_cenario);
end;

procedure Tfrm_cenario.trv_cliClick(Sender: TObject);
begin
  inherited;
 // trv_cli.Visible := false;
 // scenario.CLI_ID  := strtoint(uObj(trv_cli.selected.Data)^.Fcodigo);

  cmb_cliChange(frm_cenario);
end;

procedure Tfrm_cenario.sp_sairClick(Sender: TObject);
begin
  inherited;
  scenario.status := ' ';
end;

procedure Tfrm_cenario.cmb_domCloseUp(Sender: TObject);
begin
  inherited;
//  edit3.Text := cmb_DOM.text;
  sp2.enabled := true;
end;

procedure Tfrm_cenario.cmb_perCloseUp(Sender: TObject);
begin
  inherited;
 // edit4.Text := cmb_per.Text;
  sp2.enabled := true;
end;

procedure Tfrm_cenario.ToolButton1Click(Sender: TObject);
begin
  inherited;
 // xFont(self,fnt);
end;

procedure Tfrm_cenario.BulletsButtonClick(Sender: TObject);
begin
  inherited;
  //xBullet(self,BulletsButton);
end;

procedure Tfrm_cenario.RightAlignClick(Sender: TObject);
begin
  inherited;
    xAlign(self,Sender);
end;

procedure Tfrm_cenario.CenterAlignClick(Sender: TObject);
begin
  inherited;
  xAlign(self,Sender);
end;

procedure Tfrm_cenario.LeftAlignClick(Sender: TObject);
begin
  inherited;
    xAlign(self,Sender);
end;

procedure Tfrm_cenario.UnderlineButtonClick(Sender: TObject);
begin
  inherited;
 // xUnderline(self,UnderlineButton);
end;

procedure Tfrm_cenario.ItalicButtonClick(Sender: TObject);
begin
  inherited;
 // xItalic(self,ItalicButton);
end;

procedure Tfrm_cenario.BoldButtonClick(Sender: TObject);
begin
  inherited;
  //xBold(self,BoldButton);
end;

procedure Tfrm_cenario.spb_PasteClick(Sender: TObject);
begin
  inherited;
  xPaste(self);
end;

procedure Tfrm_cenario.spb_copyClick(Sender: TObject);
begin
  inherited;
  xcopy(self);
end;

procedure Tfrm_cenario.docextClick(Sender: TObject);
begin
  inherited;
  If edit6.text = '' then
   Begin
    If OD.execute then
     Begin
      // dbedit12.DataSource.DataSet.edit;
       edit6.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(edit6.text,'');
   end;
end;

procedure Tfrm_cenario.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   scenario.status := ' ';
end;

procedure Tfrm_cenario.LoadCOnstantObj;
var
i :integer;
begin
  inherited;

  Caption := def881;//'Scenario' ;
  SpeedButton11.Hint := def761;//'Print'   ;
  SpeedButton3.caption := def901;//quitter
  docext.Hint := def550;//'Linkar com Documento extermo' ;
  docext.Caption := def550;//'Documento externo' ;
  TabSheet1.Caption := def39;//'Description' ;
  Label12.Caption := def10005;//'nome' ;
//Label19.Caption = 'Time Unit'
//Label7.Caption = 'Referenced Period'
  Label1.Caption := defm1;//'Mechanisms Default Directory' ;
  Label13.Caption := Mensreg8_8;//'Company' ;
  TabSheet2.Caption := def1010;//'Objective' ;
  tabSheet3.Caption := DEFP2;//'Premises'  ;
  TabSheet6.Caption := defr2;//'Relevant Topics'
  TabSheet8.Caption := defc6;//'Contingencies'
end;

procedure Tfrm_cenario.spdirClick(Sender: TObject);
begin
  inherited;
    frmDirCenarios.Show;
end;

end.
