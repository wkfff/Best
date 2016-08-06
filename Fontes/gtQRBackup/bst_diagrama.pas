unit bst_diagrama;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls,Buttons, ExtCtrls, Mask, Grids, DBGrids, ComCtrls,db,dbtables,
  Menus,cls_obj,BSTdb, gtQrCtrls,OOSEG,bst_dm_rel, ActnList, ImgList,
  ToolWin;

type
  Tfrm_diag = class(TBasefrm)
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    trv_class: TTreeView;
    Edit2: TEdit;
    SpeedButton3: TSpeedButton;
    sp2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    trv_diag: TTreeView;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Salvar: TAction;
    Sair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sp_novoClick(Sender: TObject);
    procedure SP2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    
    procedure dbgDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure splClick(Sender: TObject);
    procedure Limpa_tela;
    procedure trv_classDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure trv_diagDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_diag: Tfrm_diag;
  WultdIAG : INTEGER;
  Novo_diag : Boolean;
implementation

uses bst_main, bst_treeAtiv;


{$R *.DFM}

procedure Tfrm_diag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_diag := nil;
  action := cafree;
end;



procedure Tfrm_diag.sp_novoClick(Sender: TObject);
var
Wtip : string;
begin
  
  activeControl := edit1;
  empresas.cenarios.Diagramas.Status := 'I';

end;




procedure Tfrm_diag.SP2Click(Sender: TObject);  //confirmar
Var
WCod : integer;
Wtit : string;
WNode : TtreeNode;
Begin
try
  begin
    If edit1.text = ''  then
       raise exception.create(mens87);
    If Edit2.text = '' then
       raise exception.create(mens88);

    If empresas.cenarios.Diagramas.Status = 'I' then
      begin
        with empresas.cenarios.Diagramas do
         begin
          SUB_ID               := 0;
          DIAG_PAI_ID          := 0;
          SUB_NOME             := edit1.Text;
          DIAG_ID              := '';
          ATIVIDADE_MAE        := 0;
          IDG_ID               := 0 ; //gerado automaticamente na criação
        //  criar(empresas.cenarios.Diagramas);
          status := 'M';
          If not frm_main.wassist then
           Begin
             tv.selected := tv.Incluir_TVDiag(tv.selected,empresas.cenarios.Diagramas.CLI_ID,
                   empresas.cenarios.Diagramas.PRJ_ID,
                   empresas.cenarios.Diagramas.IDG_ID,
                   empresas.cenarios.Diagramas.SUB_NOME,
                   empresas.cenarios.Diagramas.IDG_DIR,true);
           end;

         end;
         If uppercase(oAcesso.NOME) <> 'SUPERVISOR' then
                Begin
                  with oPrivilegio.Create do  //cria privilégio para o criador
                    Begin
                     CriaPrivilegioDiag(empresas.cenarios.Diagramas.CLI_ID ,empresas.cenarios.Diagramas.PRJ_ID,
                                        udado(tv.selected.data)^.FDiag , oAcesso.IDUSUARIO ,'3' ,'1' ,edit1.Text ,DATE);
                     free;
                    end;
                end;
         

      end
    else
     If empresas.cenarios.Diagramas.Status = 'M' then
      begin
         with empresas.cenarios.Diagramas do
         begin
          SUB_NOME             := edit1.Text;
          atualizar;
          tv.selected.Text := empresas.cenarios.Diagramas.sub_nome;
         end;
      end;
      close;
  end;
except
  begin
    raise;
  end;
end;

end;

procedure Tfrm_diag.SpeedButton3Click(Sender: TObject);
begin
 trv_class.visible := not trv_class.visible;
end;


procedure Tfrm_diag.dbgDblClick(Sender: TObject);
begin
  //btn_diagClick(dbg) ;
end;

 procedure Tfrm_diag.FormCreate(Sender: TObject);
var
i,wcli,wcen : integer;
begin
{If frm_main.wassist then
  Begin
    wcli := frm_demoassist.CLIENTE;
    wcen := frm_demoassist.CENARIO;
  end
 else  }
  Begin
    wcli :=  udado(tv.selected.data)^.Fcli  ;
     wcen :=  udado(tv.selected.data)^.FProj ;
  end;

 
  Limpa_tela;
  If empresas.cenarios.Diagramas.Status = 'M' then
     begin
       If not empresas.cenarios.Diagramas.Get_Diagrama(empresas.cenarios.Diagramas.CLI_ID,
                                                empresas.cenarios.Diagramas.PRJ_ID,
                                                empresas.cenarios.Diagramas.IDG_ID) then
          raise exception.create(EI1);
       edit1.text     :=  empresas.cenarios.Diagramas.SUB_NOME;
       edit2.Text     :=  empresas.cenarios.Diagramas.IDG_DIR;
       edit2.ReadOnly := true;
       speedbutton3.Visible := false;
     end;

 Begin

   FOr i := 1 to length(WCodClass) {- 1} do  // tirar -1 para mostrar UML
     Trv_class.Items.add(nil,WClass[i]);


    With TDiag_dados.create(self) do
     begin
      open_Diagramas0(wcli,wcen);
      Cria_lista(trv_diag,false,true);
     end;
 end;

 activecontrol:= edit1;

end;

procedure Tfrm_diag.DBEdit2Change(Sender: TObject);
begin
 sp2.enabled := true;
end;

procedure Tfrm_diag.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_diag.splClick(Sender: TObject);

begin    { DONE -oyves -c5.13 : Criaçào de diagrama nível 0 a partir da lista de Atividades. }
 { frm_main.Mostra_Lista('Atividades','AP', 'AP','AP',false,true,1,'IDF_AP') ;
  If WClose then
     exit;

  Dbedit1.text :=  inttostr(WCodigo_Lista);
  dbedit2.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring;
  dm.qry_diag.fieldbyname('idg_dir').asstring := 'DPN';
  SP2Click(FRM_DIAG);
  close;  }
end;

procedure Tfrm_diag.Limpa_tela;
begin
    edit1.Text := '';
    edit2.Text := '';

end;

procedure Tfrm_diag.trv_classDblClick(Sender: TObject);
begin
  edit2.Text := trv_class.selected.text;
  empresas.cenarios.Diagramas.IDG_DIR := wcodClass[trv_Class.Selected.index+1]; //;uObj(trv_class.selected.data)^.fCodigo;
  trv_class.Visible := false;

end;

procedure Tfrm_diag.FormShow(Sender: TObject);
begin
  inherited;
  activecontrol := edit1;
end;

procedure Tfrm_diag.SpeedButton1Click(Sender: TObject);
begin
   trv_diag.visible := not trv_diag.visible;
end;

procedure Tfrm_diag.trv_diagDblClick(Sender: TObject);
begin
  edit1.Text := trv_diag.selected.text;
  with TDiag_dados.create(self) do
  begin
   get_diagrama(udado(tv.selected.data)^.Fcli,
                udado(tv.selected.data)^.FProj,
                strtoint(uobj(trv_diag.selected.data)^.fCodigo));
   edit2.Text := IDG_DIR;
  end;
  empresas.cenarios.Diagramas.IDG_DIR := edit2.text;
  trv_diag.Visible := false;
end;

procedure Tfrm_diag. Loadconstantobj;
var
i : integer;

begin
  inherited;
  Caption := def35;//'Diagramas'
  Label1.Caption :=  def10005;//'Nome .'
  Label3.Caption := def23;//'Classe'
  sp2.Caption := def903;//'Confirmar'
  //SpeedButton5.Caption := def901;//'Sair   '

end;

end.

