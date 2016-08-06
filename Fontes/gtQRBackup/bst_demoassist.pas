unit bst_demoassist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, Buttons, StdCtrls,bstdb,AddFlow3Lib_TLB,cls_obj;

type
  Tfrm_demoassist = class(Tprim)
    Memo1: TMemo;
    bt: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btClick(Sender: TObject);
  private
    FCLIENTE: integer;
    FCENARIO: integer;
    procedure SetCLIENTE(const Value: integer);
    procedure SetCENARIO(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
  published
   property CLIENTE : integer read FCLIENTE write SetCLIENTE;
   property CENARIO : integer read FCENARIO write SetCENARIO;
  end;

var
  frm_demoassist: Tfrm_demoassist;

implementation

uses bst_main, bst_treeAtiv, bst_cenario, bst_diagrama;

{$R *.dfm}

procedure Tfrm_demoassist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_demoassist := nil;
  action := caFree;
  frm_main.wassist := false;
end;

procedure Tfrm_demoassist.btClick(Sender: TObject);
var
i : integer;
begin
  inherited;
  case bt.Tag of
   1 : Begin
         frm_main.Clientes1Click(nil);
         frm_main.sp_treeClick(nil);

         bt.Tag := 2;
         bt.Caption := 'Criar Cenário';
       end;

   2 : Begin
          If frm_cenario          = nil then
             frm_cenario           := Tfrm_cenario.create(self);
          frm_cenario.activeControl := frm_cenario.edit2;
          frm_cenario.sp_novo.visible := false;
          frm_cenario.pan_cli.visible := false;
          frm_cenario.sp_del.visible  := false;
          frm_cenario.SpeedButton1.visible := false;
          frm_cenario.SpeedButton2.visible := false;
           If scenario = nil then
              scenario := Tcenario.create(self);
           Scenario.CLI_ID := cliente;
           frm_cenario.sp_novo.Click;
           frm_cenario.showModal;

           frm_main.sp_treeClick(nil);
           
           bt.Tag := 3;
           bt.Caption := 'Criar Diagrama';
          end;

    3 : Begin
      //   If Empresas = nil then
       //     empresas := Tempresa.create(self);

         empresas.cenarios.Diagramas.CLI_ID    := CLIENTE;
         empresas.cenarios.Diagramas.PRJ_ID    := CENARIO;
         empresas.cenarios.Diagramas.IDG_NIVEL := 0;
         
         with Tdg.create do
            Begin










              { If DemoMaior(frm_main.wdemo,frm_main.wqtdemo-1,frm_main.WQTATIV) then  //versào demo ultrapassou
                 begin
                   Raise exception.create(mens55);
                   exit;
                 end;    }
            end;
        
          empresas.cenarios.Diagramas.Status := 'I';

               If frm_diag = nil then
                  frm_diag  := Tfrm_diag.create(self);
               frm_diag.activeControl   := frm_diag.edit2;
               frm_diag.showModal;
               frm_main.sp_treeClick(nil);
       end;

  end;


  
end;

procedure Tfrm_demoassist.SetCLIENTE(const Value: integer);
begin
  FCLIENTE := Value;
end;

procedure Tfrm_demoassist.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

end.
