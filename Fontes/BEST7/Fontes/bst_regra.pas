unit bst_regra;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  ImgList, Buttons, ToolWin, ExtCtrls, cls_obj, bstdb, dbTables, DB,
   Menus,cls_utils, Qrctrls, QuickRpt, bst_pregra, ActnList;

type
  Tfrm_regra = class(Tfrm_obj)
    Label5: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    Dbmemo2: TDBRichEdit;
    Label8: TLabel;
    Label6: TLabel;
    Dbmemo1: TDBRichEdit;
    Label9: TLabel;
    Dbmemo3: TDBRichEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    //procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sp_printClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure tb_dadosContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    
  private
    FiDe: TDados_tab;
    FiAp: TDados_tab;
    procedure SetiAp(const Value: TDados_tab);
    procedure SetiDe(const Value: TDados_tab);

    { Private declarations }
  public
  { Imprime v: preview ; p: print}
    procedure Imprime(pTipo : string;pForm : Tfrm_pregra);
    procedure Loadconstantobj;override;

  published
   property iAp : TDados_tab read FiAp write SetiAp;
   property iDe : TDados_tab read FiDe write SetiDe;
  end;

var
  frm_regra: Tfrm_regra;
  iDe : Tdados_tab;
  iCodigo : integer;
implementation

uses bst_main, bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_regra.FormCreate(Sender: TObject);
  var
i : integer;
begin
  inherited;
  iAp :=  Tdados_tab.create(self);
  iDe :=  Tdados_tab.create(self);
end;

{procedure Tfrm_regra.BitBtn1Click(Sender: TObject);
begin
  close;

end;}



procedure Tfrm_regra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_regra := nil;
  action := caFree;
end;

procedure Tfrm_regra.sp_printClick(Sender: TObject);
Begin
 If frm_pregra = nil then
   frm_pregra :=  TFrm_pregra.create(self);
 Imprime('V',frm_pregra);
 frm_pregra.close;
end;

procedure Tfrm_regra.Imprime(pTipo : string;pForm : Tfrm_pregra);
var
I : integer;
begin
  inherited;
  begin
    try
      //ATIVIDADES
      iAp.Get_PaisCorrelatos(Cliente,cenario,'AP',Id,'RN','IDF_AP','');   //pega correlaçoes
      qrDataset(Tfrm_pregra(pForm).qr_at,iAp);   // aloca dataset aos componentes da atividade(DBtext,...)

      //ELEMENTOS DE DADOS
      iDe.Get_Correlatos(Cliente,cenario,'RN',Id,'DE','IDF_DE');   //pega correlaçoes
      qrDataset(tfrm_pregra(pForm).qr_Dad,iDe);   // aloca dataset aos componentes da atividade(DBtext,...)

     with TFrm_pregra(pForm) do
      begin
         qrp.DataSet    := iDataSource.DataSet;
         //qr_at.dataset  := iAp;
         qr_dad.dataset := iDe;

         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],idatasource.dataset);
          end;
         titulo.caption     := uppercase(def67);
         subtitulo.caption  := dbedit5.text;
         If pTipo = 'V' then
           qRP.preview
         else
         If pTipo = 'P' then
           qRP.print
         else
         frm_Treeativ.ReportList.Add(TFRM_PREGRA(pForm).QRP);
      end;

    finally
    end;
  end;
end;

procedure Tfrm_regra.SetiAp(const Value: TDados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_regra.SetiDe(const Value: TDados_tab);
begin
  FiDe := Value;
end;

procedure Tfrm_regra.Loadconstantobj;
var
i : integer;

begin

  Caption := def67;//'Regra de Negócio'
  Label1.Caption := def61;//'onde aplicada
  Label5.Caption := def10005;//'Nome/Name'
  Label8.Caption := def1010;//'Objetivo/Objective'
  Label6.Caption := def39;//'Descrição/Description'
  Label9.Caption :=  def7220;//'Exceção/Exception'
  DBRadioGroup2.caption  := def12200    ;
  DBRadioGroup1.Caption := def80000;
  DBRadioGroup2.Items[0]  := def100030     ;
  DBRadioGroup2.Items[1]  := def1051     ;
  DBRadioGroup1.Items[0]  := def935    ;
  DBRadioGroup1.Items[1]  := def240     ;
 // Tb_atv.Caption := defPT61;//'Atividades Onde a Regra é Aplicada/Acivities Involved'    lv.Caption := 'Atividade' ;
 

      

end;

procedure Tfrm_regra.sp2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_regra.tb_dadosContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
  Var
  titulo : TColumnTitle;
begin
  inherited;

end;

end.

