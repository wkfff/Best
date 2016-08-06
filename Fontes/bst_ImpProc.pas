unit bst_ImpProc;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FileCtrl, Buttons, QrCtrls,  QuickRpt,cls_obj,
  Mask, Animate, GIFCtrl, ActnList, ImgList, ComCtrls, ToolWin, rxAnimate,
  rxGIFCtrl, bst_objetos;

type
   uListaDoc = ^TListadoc ;
    TListaDoc = record
      eDoc : string;
  end;

type
  Tfrm_impproc = class(TBaseFRm)
    rdg: TRadioGroup;
    Panel1: TPanel;
    DV: TDriveComboBox;
    DL: TDirectoryListBox;
    Edit1: TEdit;
    gb: TGroupBox;
    Edit2: TEdit;
    filt: TRadioGroup;
    Edit3: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    tudo: TCheckBox;
    Panel2: TPanel;
    cb_ap: TCheckBox;
    cb_rn: TCheckBox;
    cb_gd: TCheckBox;
    cb_en: TCheckBox;
    cb_ee: TCheckBox;
    cb_oi: TCheckBox;
    cb_oc: TCheckBox;
    ckb_oc_fl: TCheckBox;
    ckb_oi_fl: TCheckBox;
    ckb_ee_fl: TCheckBox;
    ckb_ev_fl: TCheckBox;
    ckb_dg_fl: TCheckBox;
    ckb_rn_fl: TCheckBox;
    ckb_at_fl: TCheckBox;
    Panel3: TPanel;
    cb_dg: TCheckBox;
    cb_uc: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    rdg_imp: TRadioGroup;
    cb_lf: TCheckBox;
    ckb_lf_fl: TCheckBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Impressao: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Salvar: TAction;
    Sair: TAction;
    rot: TRxGIFAnimator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClick(Sender: TObject);
    procedure DLDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pbPushBtnChanged(Sender: TObject; State: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
  private
    Fferme: boolean;
    procedure Setferme(const Value: boolean);

    { Private declarations }
  public
    procedure Loadconstantobj;override;

  published
   property ferme : boolean read Fferme write Setferme;
   procedure Imprimir_proc(pdg : Tdg;pExport : boolean );
  end;

var
  frm_impproc: Tfrm_impproc;

implementation

uses bst_treeAtiv, bst_main, bst_ap, bst_pativ, bst_regra, bst_pregra,
  bst_pen, bst_pativ1, BST_pentext, bst_puc, bst_pdiag, BST_pdata;

{$R *.DFM}

procedure Tfrm_impproc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 If ferme then
    begin
      frm_ImpProc := nil;
      action := caFree;
    end
 else
    begin
      action := caHide;
    end;
end;

procedure Tfrm_impproc.rdgClick(Sender: TObject);
begin
   rdg_imp.Visible := true;
   if rdg.ItemIndex = 1 then
   begin
     edit1.Text := dl.Directory;
     panel1.visible := true ;
     rdg_imp.Visible := false;
     rdg_imp.ItemIndex := 0;
     impressao.ImageIndex := 0;
   end
   else
   begin
     panel1.visible := false;
     impressao.ImageIndex := 2;
   end;
end;

procedure Tfrm_impproc.Imprimir_proc(pdg : Tdg;pExport : boolean );
var
  i,z : integer;
  mDoc : TstringList;
  wimp , parq: string;
  DateTime : TDateTime;
begin
{ TODO -oMarcelo -cAtualizações :
Esse imprimir tem que ser revisto para arrumar
a exportação. }
try
  pArq := edit1.text;
  rot.Visible := true;
  rot.Animate := true;
  rot.Repaint;
  mDoc :=  TStringList.create;
  edit2.text := '1';
  If cb_dg.Checked then
   mDoc.Add('DIAG');
  If cb_UC.Checked then
   mDoc.Add('UC');
  If cb_AP.Checked then
   mDoc.Add('AP');
  If cb_rN.Checked then
   mDoc.Add('RN');
  If cb_GD.Checked then
   mDoc.Add('DG');
  If cb_EN.Checked then
   mDoc.Add('EN');
  If cb_EE.Checked then
   mDoc.Add('EE');
  If cb_OI.Checked then
   mDoc.Add('OI');
  If cb_OC.Checked then
   mDoc.Add('OC');

  //tipo impressão
  WIMP := ' ';
  If rdg.ItemIndex = 0 then
   wimp := 'P';

  if rdg.ItemIndex = 1 then      //exportacao
     Begin
      // frm_treeativ.Wimptxt := true ;
       frm_treeativ.wdirImp := edit1.text;

       If copy(trim(frm_treeativ.WDirImp),length(trim(frm_treeativ.WdirImp)),1) <> '\'  then
          frm_treeativ.WDirImp := frm_treeativ.WdirImp + '\';
       If filt.ItemIndex = -1 then
        Raise exception.create(mens73);
       If trim(frm_treeativ.WDirImp) = '' then
        Raise exception.create(mens74);
       case filt.itemindex of
          0: begin
               pArq:= pArq + '.emf';
             end;
          1: Begin
//               FRM_TREEATIV.ExportType := etExcel;
               pArq := pArq + '.xls';
              end;
          2 :
            Begin
//               FRM_TREEATIV.ExportType := etPDF;
               pArq := pArq + '.pdf';
            end;
        end;
     end
  else
     frm_treeativ.Wimptxt := false;
  with frm_Treeativ do
   Begin
    If pExport then
     Begin
        ReportList.Clear;
        Duplic.Clear;
        DataList.Clear;
        pDg.IDG := udado(tv.Selected.Data)^.FDiag;
     end;
    Imprimir_Completo(pDg,tudo.checked,mDoc,wImp,edit1.text,cb_gd.checked);
    Imprimirdoc(pdg,'');

    If pExport then
     Begin
        If reportList.Count > 0 then
         Begin
{           If uppercase(label16.caption) = 'CONCLUIR' then
//              CombinedExportToFile(ReportList, ExportType, pArq, false, true)
           else
//           CombinedExportToFile(ReportList, ExportType, pArq, false, false) ;
}         end

        else
          showmessage(Mens77);

        //limpa os forms abertos p/emissào do relatório
        for z := 0 to ReportList.Count - 1 do
        Begin
         If (TQuickrep(ReportList[z]).Parent is  Tfrm_pativ) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pativ1) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_ap) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pen) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pentext) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_puc) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pdiag) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pdata) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pregra) then

               Tform(TQuickrep(ReportList[z]).Parent).Close;
        end;
     end;
   end;
  ferme := true;
  freeandnil(mDoc);
 finally
 rot.Animate := false;
 rot.Visible := false;
end;
close;

end;

procedure Tfrm_impproc.DLDblClick(Sender: TObject);
begin
  edit1.text := dl.Directory;
end;

procedure Tfrm_impproc.FormCreate(Sender: TObject);
begin
  edit2.text := '';
end;

procedure Tfrm_impproc.FormActivate(Sender: TObject);
begin
  edit2.text := '';
end;

procedure Tfrm_impproc.Setferme(const Value: boolean);
begin
  Fferme := Value;
end;

procedure Tfrm_impproc.pbPushBtnChanged(Sender: TObject;
  State: Boolean);
begin
 try
 // pb.Color := pbred;
 // pb.State := true;
 // pb.Enabled := false;
 // pb.repaint;

  SalvarExecute(nil);
finally
  // pb.Color := pbLime;
  // pb.State := false;
  // pb.Enabled := true;
end;

end;

procedure Tfrm_impproc.Loadconstantobj;
var
i : integer;

begin
  inherited;
  label1.Caption           := dim1;//
  Caption                  := def76;//'Impressão Processo'  ;
  rdg.Caption              := defd9;//'Destino'  ;
  rdg.Items[0]             := defi5;//'Impressora'               ;
  rdg.Items[1]             := defe24;//'Exportar para Disco'               ;
  filt.Caption                  := def1210;//'Tipo'    ;
  gb.Caption               := def761;//'Imprimir'  ;
  tudo.Caption             := defn5;//'Níveis Abaixo' ;
  Label2.Caption           := def101+'s';//'Objetos' ;
  cb_ap.Caption            := def106 ;//'Descrições de Atividades' ;
  cb_rn.Caption            := def5;//'Regras de negócio'  ;
  cb_gd.Caption            := def9 ;//'Grupos de dados'  ;
  cb_en.Caption            :=  def2;//'Eventos de negócio'  ;
  cb_ee.Caption            := def111;//'Entidades externas'  ;
  cb_oi.Caption            := def6;//'Objetos de Interface' ;
  cb_oc.Caption            := def7;//'Objetos de Controle' ;
  ckb_oc_fl.Caption        :=  defq2  ;//'Um Objeto de Controle p/Folha'  ;
  ckb_oi_fl.Caption        := defq2  ;//'Um Objeto Interface p/Folha' ;
  ckb_ee_fl.Caption        := defq2  ;//'Um Entidade Externa p/Folha' ;
  ckb_ev_fl. Caption       := defq2  ;//'Um Evento de Negócio p/Folha'  ;
  ckb_dg_fl.Caption        := defq2  ;//'Um Grupo de Dados p/Folha' ;
  ckb_rn_fl.Caption        := defq2  ;//'Uma Regra p/Folha' ;
  ckb_at_fl. Caption       := defq2  ;//'Uma Atividade p/Folha' ;
  cb_lf. Caption           := def48;//'Locais de Processamento'  ;
  ckb_lf_fl. Caption       := defq2  ;//'Um Objeto de Controle p/Folha' ;
  Label3.Caption           := def35;//'Diagramas'  ;
  cb_dg.Caption            := def355;//'Diagrama' .
  cb_uc.Caption            := def356;//'Diagrama use case'   ;
  rdg_imp.Items[0]         := deff5;//  'Folha Única'         ;
  rdg_imp.Items[1]         := defn5;//  'MultiFolha'        ;
end;

procedure Tfrm_impproc.SpeedButton5Click(Sender: TObject);
begin
  inherited;
 ferme := true;
 close;
end;

procedure Tfrm_impproc.SalvarExecute(Sender: TObject);
begin
  inherited;
  tv.Diagrama.NOME_DIAGRAMA := udado(tv.selected.Data)^.FNome;
  Imprimir_Proc(tv.Diagrama,true);
end;

end.

