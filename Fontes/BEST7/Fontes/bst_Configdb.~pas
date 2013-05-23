unit bst_Configdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, StdCtrls, ExtCtrls, Buttons, BST_TELASTD, Mask, ToolEdit, 
  registry, ComCtrls, fonctions, ImgList, Menus, DB, ADODB, bst_BaseFrm, 
  strutils, ToolWin;

type
  Tfrm_ConfigDB = class(TBasefrm)
    spb: TSpeedButton;
    pan_config: TPanel;
    drv: TDriveComboBox;
    dl: TDirectoryListBox;
    fl: TFileListBox;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dgfiles: TOpenDialog;
    PageControl1: TPageControl;
    tb_disp: TTabSheet;
    tb_configo: TTabSheet;
    Label3: TLabel;
    _Edit4: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    pan_sql: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    rdg: TRadioGroup;
    cmb_alias: TComboBox;
    Label5: TLabel;
    rg: TListBox;
    spdir: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    ADOConnection1: TADOConnection;
    SpeedButton3: TSpeedButton;
    spDir1: TSpeedButton;
    dlb: TDirectoryListBox;
    dgfiles2: TOpenDialog;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    procedure spdirClick(Sender: TObject);
   // procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
    procedure dlDblClick(Sender: TObject);
    procedure flDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rdgClick(Sender: TObject);
    procedure cmb_bddefCloseUp(Sender: TObject);
    procedure dgdirChange(Sender: TObject);
    procedure cmb_aliasCloseUp(Sender: TObject);
    procedure rgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgDblClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure spDir1Click(Sender: TObject);
  private
    procedure Salva_alias(pNome: string);
    procedure Prepara_repos;
    { Private declarations }
  public
    { Public declarations }
    procedure LoadConstantObj;override;
  end;

var
  frm_ConfigDB: Tfrm_ConfigDB;
  wheightGr,WheightPq : integer;
  wfile : string = '';
implementation

uses bst_main,bstdb, bst_dm_rel, bst_dirCenario;


{$R *.dfm}

procedure FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  //frm_ConfigDB := nil;
 // action := caFree;
end;

procedure Tfrm_configdb.spdirClick(Sender: TObject);
begin
  inherited;
 If dgfiles.Execute then
  Begin
   edit2.text := dgfiles.FileName;
   dlb.Directory := dgfiles.FileName;
   Edit1.Text := dlb.Directory;
   //EDIT4.Text := '';
   //cmb_alias.Text := '';

  end;

end;

procedure Tfrm_ConfigDB.dlDblClick(Sender: TObject);
begin
  inherited;
  If not fl.Visible then
     begin
      edit3.Text := dl.Directory;
     end;
end;

procedure Tfrm_ConfigDB.flDblClick(Sender: TObject);
begin
  inherited;
  edit3.Text := fl.FileName;
end;

procedure Tfrm_ConfigDB.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If not fl.visible then
     edit1.text := edit3.Text
  else
     edit2.text := edit3.Text ;
  height := Wheightpq;
  position := poDesktopCenter;
  pan_config.Visible := false;
  //If edit2.Visible then
     //activeControl := edit2;
end;

procedure Tfrm_ConfigDB.spbClick(Sender: TObject);
var
ibanco : Tbanco;
i : integer;
achou : boolean ;
reg : Tregistry;
wnom,wext : string;
begin
// If edit4.text = '' then
 If cmb_alias.text = '' then
   Raise exception.create(mens80);
try
  wnom := ExtractFilepath(application.ExeName );
  wnom := wnom+cmb_alias.text ;
  wext := Extractfileext(wnom) ;
  If wext = '' then
    wnom := wnom + '.als';
   Salva_Alias(wNom);
finally
  oAcesso.NOME := '';
  oAcesso.senha := '';
  close;
end;
end;

procedure Tfrm_ConfigDB.Salva_alias(pNome : string);
 Begin
   with TstringList.create do
     Begin
     
      add(edit1.Text);    //diretorio diagramas;
      add(edit2.Text);    // bd Access
      add(inttostr(rdg.itemIndex+1));  // tipo banco : 1: access ; 2 : sqlserver; 3 : informix
      add(edit5.Text);  //servidor (tipo 2 e 3
      add(edit6.Text); // nome Banco (tipo 2 e 3)
      savetofile( pNome);
     end;
 end;

procedure Tfrm_ConfigDB.FormCreate(Sender: TObject);
var
i: integer;
begin
 // inherited;

  position := poScreenCenter;
  dl.Directory := extractFilePath(Application.ExeName);
  cmb_alias.Items := fl.Items;
  rg.Items.Clear;
  for i := 0 to fl.items.Count - 1 do
   Begin
     rg.Items.add(Parse_left(fl.Items[i],'.'));
   end;
  If rg.Count > 0 then
    rg.ItemIndex := 0; 
 {rg.items := fl.items; }
  dgfiles.Filter := 'Access (*.mdb)|*.MDB';
  dgfiles.FilterIndex := 1;
  
end;

procedure Tfrm_ConfigDB.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  close;
  application.Tag := 1;
  
end;

procedure Tfrm_ConfigDB.rdgClick(Sender: TObject);

begin
  inherited;
  // wfile := ExtractFileDir( application.ExeName )+'\bddef.txt' ;
//  EDIT4.Text := '';
   If rdg.itemindex = 0 then    //access
    Begin
    //  dgfiles.Filter := '*.mdb'  ;
      edit2.visible := true;
      activecontrol := edit2;
      pan_sql.Visible := false;
      spdir.Visible := true;
    end
     
   else       //`bancos SQL
     Begin
     edit2.visible := false;
     spdir.Visible := false;
    // wfile :=  GetCurrentDir+'\bddef.txt' ;
      pan_sql.Visible := true;
      activecontrol := edit5;
      {If Fileexists(wFile) then
       Begin
        cmb_bddef.Items.LoadFromFile(wFile);
       end; }
    end;
end;

procedure Tfrm_ConfigDB.cmb_bddefCloseUp(Sender: TObject);
begin
  inherited;
  // edit6.Text := cmb_bddef.Items[cmb_bddef.itemindex] ;
end;

procedure Tfrm_ConfigDB.dgdirChange(Sender: TObject);
begin
  inherited;
   edit1.text := dgfiles.FileName;
   If dgfiles.FileName <> '' then
     Begin
      If rightstr(dgfiles.FileName,1) <> '\' then
       dgfiles.FileName := dgfiles.FileName + '\';
     end;
   dgfiles.InitialDir := edit1.text ;
   //EDIT4.Text := '';
   cmb_alias.Text := '';
end;

procedure Tfrm_ConfigDB.cmb_aliasCloseUp(Sender: TObject);
var
i : integer;
wlist : TstringList;
begin
  inherited;
  If cmb_alias.itemindex >= 0 then
   Begin
//     EDIT4.Text := ExtractFileName(cmb_alias.Items[cmb_alias.itemindex]);
     cmb_alias.Text :=  ExtractFileName(cmb_alias.Items[cmb_alias.itemindex]);
     prepara_repos;

   end;


end;

procedure Tfrm_ConfigDB.Prepara_repos;
var
i : integer;
wlist : TstringList;
begin
  inherited;
 //If cmb_alias.itemindex >= 0 then
   Begin
      pagecontrol1.ActivePage := tb_configo;
      try
        wlist :=  TstringList.create ;
         Begin
//          wlist.LoadFromFile(dl.Directory+'\'+ edit4.text);
          wlist.LoadFromFile(dl.Directory+'\'+ cmb_alias.text);
          If not frm_main.Checa_Ambiente(wlist[0]) then
            exit
          else
            Begin
              edit1.Text    :=  wlist[0];
              edit2.Text    :=  wList[1];
              RDG.ItemIndex :=  STRTOINT(wList[2]);
              edit5.Text    :=  wList[3];
              edit6.Text    :=  wList[4];
              rdg.OnClick(nil);
            end;
         end;
      finally
        pagecontrol1.ActivePage := tb_disp;
        freeandnil(wList);
      end;
   end;

end;



procedure Tfrm_ConfigDB.rgClick(Sender: TObject);
begin
  inherited;
  If rg.ItemIndex > -1 then
    Begin
       //edit4.text := rg.Items[rg.itemindex]+'.als';
       cmb_alias.Text := rg.Items[rg.itemindex]+'.als';
       prepara_repos;
    end
  else
    raise exception.create(mens80);

end;

procedure Tfrm_ConfigDB.FormShow(Sender: TObject);
var
i: integer;
begin
  inherited;
  pagecontrol1.ActivePage := Tb_Disp;
end;

procedure Tfrm_ConfigDB.LoadConstantObj;

begin
  inherited;
  Caption := def7775;//'Configurações/Configurations'
  SPEEDbUTTON3.Caption := def651;//'Encerrar/Close'
  TB_DISP.Caption := def1070;//'Repositórios Existentes/Existing Repositories'
  label5.Caption := def9230;//'Escolher o Repositório/Select Repository'
  tb_configo.Caption := def7776 ;//'Configuração de Repositórios/Repository Configuration'
  label1.Caption := def353;//'Diretório Diagramas/ Directory for Diagrams'
  rdg.Caption := def88;//'Banco de Dados/DataBase'
  LABEL2.Caption := def99;//'Servidor/Server :'
  LABEL4.Caption := def88;//'Banco de dados/database :'
  POPUPMENU1.Items[0].Caption := def84;//= 'Excluir'


end;

procedure Tfrm_ConfigDB.rgDblClick(Sender: TObject);
begin
  inherited;
  spbClick(nil);
end;

procedure Tfrm_ConfigDB.Excluir1Click(Sender: TObject);
var
wnom : string;
begin
  inherited;
  wnom := ExtractFilepath(application.ExeName );
  wnom := wnom+rg.Items[rg.itemindex]+'.als' ;
  If MessageDlg(mens120,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
      If Fileexists(wnom) then
       Begin
        deleteFile(Wnom);
        rg.DeleteSelected;
       end;
       
      end;
end;

procedure Tfrm_ConfigDB.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  close;
  bdx := nil;
  frm_main.PARA := true;
  application.terminate;
end;

procedure Tfrm_ConfigDB.spDir1Click(Sender: TObject);
begin
  inherited;

  dgfiles2.Filter := 'Add (*.ADD)|*.ADD';
  dgfiles2.FilterIndex := 1;
  dgfiles2.FileName := dgfiles.FileName;

 If dgfiles2.Execute then
  Begin
   dlb.Directory := dgfiles2.FileName;
   edit1.text := dlb.Directory;

  end;
end;

end.

