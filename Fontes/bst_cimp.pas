unit bst_cimp;

interface

uses
  Windows, Messages, bst_BaseFrm,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ActnList, ImgList, ComCtrls, ToolWin;

type
  Tfrm_cimp = class(TBaseFrm)
    Label1: TLabel;
    viz: TSpeedButton;
    imp: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ckb1: TCheckBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Visualizar: TAction;
    Imprimir: TAction;
    Sair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure vizClick(Sender: TObject);
    procedure impClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

    { Private declarations }
  public
   procedure LoadConstantObj;override;
  end;

var
  frm_cimp: Tfrm_cimp;

implementation

uses bst_main;


{$R *.DFM}

procedure Tfrm_cimp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_cimp    := nil;
  action := caFree;
end;

procedure Tfrm_cimp.FormCreate(Sender: TObject);
begin
 canc := false;
end;

procedure Tfrm_cimp.vizClick(Sender: TObject);
begin
  prev := true;
  wForcenewpage := ckb1.Checked;
  close;
end;

procedure Tfrm_cimp.impClick(Sender: TObject);
begin
   prev := false;
   close;
end;

procedure Tfrm_cimp.SpeedButton1Click(Sender: TObject);
begin
  Canc := true;
  close;
end;

procedure Tfrm_cimp.LoadConstantObj;
begin
  inherited;
  Caption              := def761;//'Impressão' ;
  viz.Caption          := defv2;//'Vizualizar'  ;
  imp.Caption          := def761;//'Imprimir' ;
  SpeedButton1.Caption := defc32 ;//'Cancelar' ;
  ckb1.Caption         := defq2;//'Quebra por Objeto'  ;
end;

end.
