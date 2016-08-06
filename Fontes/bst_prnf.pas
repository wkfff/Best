unit bst_prnf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, PRNFLOWLib_TLB, Buttons,cls_obj, bstDB, AxCtrls,
  AddFlow3Lib_TLB, ExtCtrls, StdCtrls,printers, ComCtrls, ToolWin,
  ActnList, ImgList;

type
  Tfrm_prnf = class(TForm)
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    z1: TSpeedButton;
    Edit0: TEdit;
    z2: TSpeedButton;
    Panel2: TPanel;
    pEmp: TLabel;
    pProj: TLabel;
    pProc: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    sp1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Edit1: TEdit;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    PrimeiraPagina: TAction;
    ParteAnterior: TAction;
    PartePosterior: TAction;
    UltimaPagina: TAction;
    Aumentar: TAction;
    Diminuir: TAction;
    Propriedades: TAction;
    Imprimir: TAction;
    Sair: TAction;
    prnf: TPrnFlow;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure z1Click(Sender: TObject);
    procedure z2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit0Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sp1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    
  private
    
    { Private declarations }
  public
   procedure show;
    { Public declarations }
  end;

var
  frm_prnf: Tfrm_prnf;
  iemp : Tempresa;
  xprop,yprop : integer;
  wmousedown : boolean;
implementation

uses bst_main, bst_prnprop, bst_ImpProc;


{$R *.dfm}

procedure Tfrm_prnf.SpeedButton2Click(Sender: TObject);
begin
  prnf.PriorPage;
end;

procedure Tfrm_prnf.SpeedButton3Click(Sender: TObject);
begin
  prnf.NextPage;
end;

procedure Tfrm_prnf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_prnf := nil;
  action := caFree;
end;

procedure Tfrm_prnf.FormCreate(Sender: TObject);
begin
   iEmp := tempresa.create(self);
     try
       iemp.Open_Empresa(udado(tv.Selected.Data)^.Fcli) ;
       pEmp.caption  := iEmp.CLI_NOME;
       iEmp.cenarios.Open_Cenario(udado(tv.Selected.Data)^.Fcli,udado(tv.Selected.Data)^.FProj);
       pProj.caption := iEmp.cenarios.PRJ_TITULO;
     finally
       iEmp.Free;
     end;
    pProc.caption   := udado(tv.Selected.Data)^.FNome;
end;

procedure Tfrm_prnf.z1Click(Sender: TObject);
var
z : integer;
begin
  z := prnf.Zoom;
  z := z + 10;
  If z > 400 then
   z :=400;
  prnf.Zoom := z;
  edit1.Text := inttostr(z);
end;

procedure Tfrm_prnf.z2Click(Sender: TObject);
var
z : integer;
begin
  z := prnf.Zoom;
  z := z - 10;
  If z < 10 then
   z := 10 ;
  prnf.Zoom := z;
  edit1.Text := inttostr(z);
end;

procedure Tfrm_prnf.FormShow(Sender: TObject);
var
s ,s1: string;
w,h : integer;
begin

 show;

end;

procedure Tfrm_prnf.show;
var
s ,s1: string;
w,h : integer;
begin

  prnf.hWndFlow := tv.Diagrama.hWnd;
  prnf.DocName := udado(tv.Selected.Data)^.FNome;
  prnf.preview := false;
  s :=  def65+pemp.caption;//+'  Cenário : '+  pproj.caption  ;
  s1 := formatdatetime('dd-mmm-yyyy',date)+'|'+prnf.DocName+'|'+'<PAGE>';
  PrnF.Header :=   S1;
 // PrnF.Footer := '|- Page <PAGE> -|'+formatdatetime('dd-mmm-yyyy',date);
  prnF.Footer := '';
  prnf.Zoom := 100;

  edit1.Text := '100';
  printer.PrinterIndex := -1;
  printer.Orientation := poLandscape;
  prnf.Font := self.Font;
  w := prnf.Width;
  h := prnf.height;
  prnf.printersettings := true;
  prnf.PrintDoc;

end;

procedure Tfrm_prnf.Edit0Exit(Sender: TObject);
begin
  If edit1.text <> '' then
   Begin
    If  StrToInt(Edit1.Text) > 400  then
     edit1.Text := '400'
    else
    If  strtoint(edit1.Text) < 10  then
     edit1.Text := '10' ;
   end;
  prnf.Zoom := StrToInt(edit1.Text);
end;

procedure Tfrm_prnf.SpeedButton1Click(Sender: TObject);
begin
 // If frm_ImpProc <> nil then
 //   FRM_PRNF.prnf.PrinterSettings := false
 // else
  FRM_PRNF.prnf.PrinterSettings := true;
  FRM_PRNF.prnf.preview := false;
  frm_prnf.prnf.PrintDoc;
  FRM_PRNF.prnf.PrinterSettings := false;
end;

procedure Tfrm_prnf.SpeedButton4Click(Sender: TObject);
begin
  prnf.PreviewPage := 1;

end;

procedure Tfrm_prnf.SpeedButton5Click(Sender: TObject);
begin
  prnf.PreviewPage := prnf.PageCount;
end;

procedure Tfrm_prnf.sp1Click(Sender: TObject);
begin
 If frm_prnprop     = nil then
    frm_prnprop     := Tfrm_prnprop.create(self);
 with frm_prnprop do
  Begin
    edit2.Text := floattostr(prnf.marginleft);
    tbme.Position :=  trunc(prnf.marginleft) ;
    tbmd.Position :=  trunc(prnf.marginRight) ;
    tbms.Position :=  trunc(prnf.marginTop) ;
    tbmi.Position :=  trunc(prnf.marginBottom) ;
    tbrod.Position :=  trunc(prnf.marginFooter) ;
    tbcab .Position :=  trunc(prnf.marginHeader) ;

    cmb_borda.ItemIndex := prnf.PageBorder;
  end;

 frm_prnprop.show;
 
end;

procedure Tfrm_prnf.SpeedButton6Click(Sender: TObject);
begin
  close;
end;

end.
