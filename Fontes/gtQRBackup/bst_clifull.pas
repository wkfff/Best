unit bst_clifull;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,Db, DBTables,BSTdb, ComCtrls, gtQrCtrls,
  bst_baseFrm,bst_dm_rel, ActnList, ImgList, ToolWin;

type
  Tfrm_clifull = class(TBasefrm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    cmb_ari: TComboBox;
    Panel1: TPanel;
    sp_imp: TSpeedButton;
    sp_novo: TSpeedButton;
    sp_del: TSpeedButton;
    sp_canc: TSpeedButton;
    sp2: TSpeedButton;
    trv_cli: TTreeView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Memo1: TMemo;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    Novo: TAction;
    Excluir: TAction;
    Desfazer: TAction;
    Confirmar: TAction;
    Imprimir: TAction;
    ToolButton8: TToolButton;
    Sair: TAction;
    ImageListNovo: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure sp_delClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_ariChange(Sender: TObject);
    procedure sp_novoClick(Sender: TObject);
    procedure cmb_cliChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Limpa_Tela;
    procedure SpeedButton1Click(Sender: TObject);
    procedure trv_cliClick(Sender: TObject);
  private
    { Private declarations } keyString : Tstrings;
    
  public
  procedure Loadconstantobj; override;
    { Public declarations }
  end;
 type
  cdado = ^TCli;
  Tcli = record
     FCodigo: integer;
     fCli   : integer;
     fCliNOme : string;
     fProj  : integer;
     fprojNome : string;
 end;
var
  frm_clifull: Tfrm_clifull;
  ydado : cdado;

implementation

uses bst_main, bst_ari, bst_treeAtiv, bst_demoassist;



{$R *.DFM}

procedure Tfrm_clifull.FormClose(Sender: TObject;
  var
    Action: TCloseAction);
begin
  frm_clifull := nil;
  action := cafree;
  //frm_main.CoolBar1.Visible := true;
  frm_main.FormShow(sender);
end;



procedure Tfrm_clifull.BitBtn2Click(Sender: TObject);
begin
  empresas.status := ' ';
  close;
end;

procedure Tfrm_clifull.sp2Click(Sender: TObject);
begin
try
  begin
    If edit1.text = '' then
       raise exception.create(mens19);
    If Edit2.text = '' then
       raise exception.create(mens20);
    //If Edit3.text = '' then
       //raise exception.create(mens21);

    If empresas.status = 'I' then
      begin
       try
        with empresas do
         begin
          CLI_RAZ_O_SOCIAL    := edit2.text;
          CLI_NOME            := edit1.Text;
          CLI_AREA_INTERESSE  := '.';//edit3.Text;
          criar(empresas);
          status := 'M';
          sp_del.visible  := true;
          sp_novo.Visible := true;
          sp_novo.Enabled := true;
          FormShow(frm_clifull);
          If frm_treeativ <> nil then
             tv.Incluir_No(nil,empresas.cli_id,0,0,empresas.CLI_NOME);
         end;
         
      finally
        //FreeandNil(Empresas);
      end;
     end
    else
    If empresas.status = 'M' then
      begin
         try
            with empresas do
             begin
              CLI_RAZ_O_SOCIAL    := edit2.text;
              CLI_NOME            := edit1.Text;
              CLI_AREA_INTERESSE  := '.';//edit3.Text;
              If not atualizar(empresas.CLI_ID) then
                 raise exception.create(mens86);
              If frm_treeativ <> nil then
                 tv.selected.Text := empresas.CLI_NOME;
             end;
          finally
          //  FreeandNil(Empresas);
          end;
      end;
  // If frm_treeativ <> nil then
      close;
    If frm_main.wAssist then
     Begin
      frm_demoassist.cliente := empresas.cli_id;
      showmessage('O BEST vai mostrar agora o Cliente criado na árvore de Diagramas!'#13+
                  'Após examinar a árvore, clique no X para fechar a árvore e voltar ao Assistente!'); 
     end;

  end;
except
  begin
    raise;
  end;
end;
  
end;


procedure Tfrm_clifull.DBEdit1Change(Sender: TObject);
begin
  SP2.ENABLED := TRUE;

end;


procedure Tfrm_clifull.sp_delClick(Sender: TObject);
begin

  empresas.Apagar(empresas.CLI_ID) ;
  Limpa_tela;
  FormShow(frm_clifull);
end;




procedure Tfrm_clifull.FormCreate(Sender: TObject);
begin
 inherited;
    If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
      Begin
        //panel1.visible := false;
      end
    Else
      Begin
          //sp_novoClick(sender);
      End;
  If frm_main.wassist then
      memo1.Visible := true;
end;

procedure Tfrm_clifull.Limpa_Tela;
begin
   edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
end;

procedure Tfrm_clifull.cmb_ariChange(Sender: TObject);
begin
  edit3.text := cmb_ari.text;
end;

procedure Tfrm_clifull.sp_novoClick(Sender: TObject);
begin
  empresas.status := 'I';
  sp_novo.enabled := false;
  activeControl := edit1;
  empresas.CLI_ID := 0;
  Limpa_tela;
end;

procedure Tfrm_clifull.cmb_cliChange(Sender: TObject);
begin
 // edit1.text := cmb_cli.Text;
  empresas.Open_Empresa(strtoint(uObj(trv_cli.selected.data)^.Fcodigo));
  edit1.Text := empresas.CLI_NOME;
  edit2.Text := empresas.CLI_RAZ_O_SOCIAL;
  edit3.Text := empresas.CLI_AREA_INTERESSE;
  empresas.Status := 'M';
  activeControl := edit2;
end;

procedure Tfrm_clifull.FormShow(Sender: TObject);
begin
 inherited;
 If empresas = nil then
 Begin
    Empresas       := Tempresa.create(self);
    sp_novoClick(sender);
 End;
 If empresas.status = 'M' then
    begin
      If not empresas.Open_Empresa(empresas.cli_id) then
         raise exception.create(EI1);
      edit1.Text := empresas.fieldbyname('CLI_NOME').asstring;
      edit2.Text := empresas.fieldbyname('CLI_RAZ_O_SOCIAL').asstring;
      edit3.Text := empresas.fieldbyname('CLI_AREA_INTERESSE').asstring;
    end
 else
    begin
      empresas.Open_All;
      empresas.Cria_lista(trv_cli,false,true);
    end;

 while true do
  begin
    If fileExists(bdx.dirfluxo+'areas.txt') then
       begin
         cmb_ari.Items.LoadFromFile(bdx.dirfluxo+'areas.txt') ;
         break;
       end           
    else
      begin
        If MessageDlg(Mens14,
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
             If frm_ari           = nil then
                frm_ari           := Tfrm_ari.create(self);
             frm_ari.showModal;
             continue
           end
        else
           break;
      end;
  end;
end;

procedure Tfrm_clifull.SpeedButton1Click(Sender: TObject);
begin
  trv_cli.visible  := not trv_cli.visible;
end;

procedure Tfrm_clifull.trv_cliClick(Sender: TObject);
begin
  edit1.Text := trv_cli.selected.text;
  trv_cli.Visible := false;
  cmb_cliChange(frm_cliFull);
end;
procedure Tfrm_CLIfULL.Loadconstantobj;
begin

  frm_clifull.Caption := def65;//'Cliente' ;
  Label1.Caption := def10005;//'Nome'
  Label2.Caption := def67210;//'Razão Social' ;
  Label3.Caption := def3211;//'Área de Interesse' ;
  SpeedButton2.Caption := def901;//'Sair ' ;
  sp_imp.Hint := def761;//'Imprimir' ;
  sp_novo.Caption := def850;// 'Novo      ' ;
  sp_del.Caption := def84;//'Eliminar ' ;
  //sp_canc.Hint := 'Cancela';
  //sp_canc.Caption := 'Desfazer';
  sp2.Caption := def903;//'Confirmar';



end;

end.
