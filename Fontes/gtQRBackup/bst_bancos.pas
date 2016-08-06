unit bst_bancos;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, gtQrCtrls,fonctions,cls_utils,
  ComCtrls, ToolWin, ImgList, FileCtrl;

type
  Tfrm_bancos = class(TBaseFRm)
    rdg: TRadioGroup;
    SpeedButton1: TSpeedButton;
    gpb: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cmb_ip: TComboBox;
    cmb_nome: TComboBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    dc: TDriveComboBox;
    dl: TDirectoryListBox;
    fl: TFileListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure rdgClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cmb_ipCloseUp(Sender: TObject);
    procedure cmb_nomeCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure flDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;
resourcestring
Mensbco1 = 'Escolher um Tipo e Banco de Dados';
var
  frm_bancos: Tfrm_bancos;
  wdir : string;
implementation

uses bst_treeAtiv, bst_objetos, bst_qry, bst_main;

{$R *.dfm}

procedure Tfrm_bancos.FormClose(Sender: TObject; var Action: TCloseAction);
var
wn : string;
begin
  wdir := ExtractFileDir(application.ExeName);
  wn := wdir +'\'+'iplist.txt';
  
  If edit1.text <> '' then
    Begin
     If not InList(edit1.text,cmb_ip.items) then
       Begin
         cmb_ip.Items.Add(edit1.text) ;
         cmb_ip.items.SaveToFile (wn);
       end;
    end;
  If cmb_ip.Items.Count > 15 then
    cmb_ip.Items.Clear;;

  wn := wdir +'\'+'nomlist.txt';
  If edit2.text <> '' then
    Begin
      If not InList(edit2.text,cmb_nome.items) then
         Begin
           cmb_NOME.Items.Add(edit2.text) ;
           cmb_nome.items.SaveToFile (wn);
         end;
    end;
   If cmb_nome.Items.Count > 15 then
    cmb_nome.Items.Clear;;

  frm_treeativ.BANCO_ATU := edit2.Text;
  frm_treeativ.SERVIDOR_ATU := edit1.Text;
  frm_bancos := nil;
  action := caFree;
end;

procedure Tfrm_bancos.SpeedButton1Click(Sender: TObject);
begin
  frm_treeAtiv.dir_canc := false;
  If rdg.ItemIndex = -1 then
   Raise exception.create(Mensbco1);
  frm_treeativ.Tipo_banco := rdg.ItemIndex;
  frm_Treeativ.Nome_banco := rdg.Items[ rdg.ItemIndex];
  case rdg.ItemIndex of
   3,4 : Begin
          frm_bancos.Height := 192;
          frm_Treeativ.Nome_banco := edit2.text;
          frm_Treeativ.servidor   := edit1.text;
         end;
  end;

  frm_treeativ.Pesq_bancos(true,rdg.itemIndex,'');
  close;
end;

procedure Tfrm_bancos.rdgClick(Sender: TObject);
begin
   case  rdg.ItemIndex of
    0,1,2 : gpb.visible := FALSE;
    3,4 : Begin    //sql
         gpb.visible := true;
         
        end;

   end;
end;

procedure Tfrm_bancos.SpeedButton2Click(Sender: TObject);
begin
   frm_Treeativ.Dir_canc := true;
   close;
end;

procedure Tfrm_bancos.SpeedButton3Click(Sender: TObject);
begin

  frm_treeAtiv.dir_canc := TRUE;
  If rdg.ItemIndex = -1 then
   Raise exception.create(Mensbco1);
  frm_treeativ.Tipo_banco := rdg.ItemIndex;
  frm_Treeativ.Nome_banco := rdg.Items[ rdg.ItemIndex];     
  
   case rdg.ItemIndex of
   0,1,2 :
     Begin
       frm_Treeativ.Nome_banco := frm_treeativ.dir_db;
       ;
     end;
   3,4 : Begin
          frm_Treeativ.Nome_banco := edit2.text;
          frm_Treeativ.servidor   := edit1.text;
       end;
  end;
  frm_qry.adc :=   frm_treeativ.Pesq_bancos(true,rdg.itemIndex,'');
  close     ;



end;

procedure Tfrm_bancos.cmb_ipCloseUp(Sender: TObject);
begin
  edit1.Text := cmb_ip.Items[cmb_ip.itemindex];
end;

procedure Tfrm_bancos.cmb_nomeCloseUp(Sender: TObject);
begin
  edit2.Text := cmb_nome.Items[cmb_nome.itemindex];
end;

procedure Tfrm_bancos.FormCreate(Sender: TObject);
var
wn : string;
begin
  wdir := ExtractFileDir(application.ExeName);
  wn := wdir +'\'+'iplist.txt';
  If Fileexists(wn) then
    cmb_ip.items.loadfromfile (wn);

  wn := wdir +'\'+'nomlist.txt';
  If Fileexists(wn) then
    cmb_nome.items.loadfromfile (wn);


end;

procedure Tfrm_bancos.SpeedButton4Click(Sender: TObject);
begin
  If frm_qry <> nil then
   frm_qry.adc := Procura_bancos(true,rdg.itemIndex,'');
  close;
end;

procedure Tfrm_bancos.Loadconstantobj;
var
i : integer;

begin
  inherited;
  Caption              := def88 ;//'Bancos de Dados/Data base'  ;
 // SpeedButton3.Caption := 'Query SQL' ;
  SpeedButton1.Caption := deft14;//'Tabelas/Tables'   ;
  SpeedButton2.Caption := defc32;//'Cancelar/Cancel'  ;
  rdg.Caption          := def88;//'Bancos de Dados/Data Base' ;
  Label1.Caption       := def100;//'Nome do Banco/DB name'   ;
  Caption              := def99 ;//'Servidor/Server'  ;

end;

procedure Tfrm_bancos.flDblClick(Sender: TObject);
begin
  inherited;
  frm_treeativ.dir_db    := fl.FileName;
  frm_treeativ.diretorio := dl.Directory;
end;

end.

