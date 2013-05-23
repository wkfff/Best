unit bst_todo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, Grids, DBGrids,bstdb, Buttons, ExtCtrls,fonctions,
  StdCtrls, ActnList, ImgList, ComCtrls, ToolWin;

type
  TFRM_TODO = class(Tprim)
    dbg: TDBGrid;
    Panel3: TPanel;
    sp_print: TSpeedButton;
    SpeedButton5: TSpeedButton;
    sp1: TSpeedButton;
    ackb1: TCheckBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ckb1: TCheckBox;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Propriedades: TAction;
    Imprimir: TAction;
    Sair: TAction;
    ToolButton6: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgTitleClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure sp1Click(Sender: TObject);
  private
    FiTodo: TTodo;
    Ftudo: boolean;
    FCLIENTE: INTEGER;
    FCENARIO: integer;
    procedure SetiTodo(const Value: TTodo);
    procedure Settudo(const Value: boolean);
    procedure SetCENARIO(const Value: integer);
    procedure SetCLIENTE(const Value: INTEGER);
    
    { Private declarations }
  public
    { Public declarations }
  published
   property iTodo : TTodo read FiTodo write SetiTodo;
   property tudo : boolean read Ftudo write Settudo;
   property CLIENTE : INTEGER read FCLIENTE write SetCLIENTE;
   property CENARIO : integer read FCENARIO write SetCENARIO;
   procedure LoadConstantObj;override;
  end;

var
  FRM_TODO: TFRM_TODO;

implementation

uses bst_treeAtiv, bst_main;

{$R *.dfm}

procedure TFRM_TODO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  
  If iTodo.IndexName <> '' then
   iTodo.IndexName := '';
  iTodo.fClient.Active := false; 
  frm_todo := nil;
  action := caFree;
end;

procedure TFRM_TODO.SetiTodo(const Value: TTodo);
begin
  FiTodo := Value;
end;

procedure TFRM_TODO.FormCreate(Sender: TObject);
begin
  inherited;
  iTodo :=  TTodo.create(self);
  TUDO := TRUE;
end;

procedure TFRM_TODO.FormShow(Sender: TObject);
begin
  inherited;
  dbg.DataSource := iTodo.DataExt;
end;

procedure TFRM_TODO.dbgTitleClick(Column: TColumn);

var
i : integer;
begin
  inherited;


  with itodo.fClient.IndexDefs do
  begin
    i := IndexOf(column.FieldName);
    If i < 0 then
      add(column.FieldName,column.FieldName,[]);
    itodo.fclient.IndexName := column.FieldName;
    itodo.fclient.First;
  end;
end;


procedure TFRM_TODO.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFRM_TODO.sp_printClick(Sender: TObject);
begin
  inherited;
   ListPrt(dbg,def911,'');
end;

procedure TFRM_TODO.sp1Click(Sender: TObject);
begin
  inherited;
  If TUDO then //cenario
    frm_todo.iTodo.Get_dados (iTodo.CLI_ID,iTodo.PRJ_ID,0,ckb1.Checked)
 else
    frm_todo.iTodo.Get_dados (iTodo.CLI_ID,iTodo.PRJ_ID,iTodo.IDG_ID,ckb1.Checked);



 If TUDO then
  sp1.Caption := def9111
 else
  sp1.Caption := def9112;
 TUDO := NOT TUDO;

end;

procedure TFRM_TODO.Settudo(const Value: boolean);
begin
  Ftudo := Value;
end;

procedure TFRM_TODO.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

procedure TFRM_TODO.SetCLIENTE(const Value: INTEGER);
begin
  FCLIENTE := Value;
end;



procedure TFRM_TODO.LoadConstantObj;
begin
  inherited;
  Caption                        := def911;//'Pendências' ;
  dbg.columns[0].title.caption   := def6220;//'Data'      ;
  dbg.columns[1].title.caption   := def882 ;//'Categoria'      ;
  dbg.columns[2].title.caption   := def39 ;//'Descrição'     ;
  dbg.columns[3].title.caption   := def450;//'Responsável'     ;
  sp_print.Hint                  := def761;//'Imprimir Atividade'  ;
  SpeedButton5.Caption           := def901;//'Sair   ' ;
  sp1.Caption                    := def9112;//'Pendências do Cenário'  ;
  ckb1.Caption                   := defe23;//'Em Aberto' ;

end;


end.
