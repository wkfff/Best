unit bst_todoger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, Grids, DBGrids,bstdb, Buttons, ExtCtrls,fonctions,
  ImgList, ComCtrls, ToolWin;

type
  TFRM_TODOGER = class(Tprim)
    dbg: TDBGrid;
    Panel3: TPanel;
    sp_print: TSpeedButton;
    SpeedButton5: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgTitleClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
  private
    FiTodo: TTodo;
    procedure SetiTodo(const Value: TTodo);
    { Private declarations }
  public
    { Public declarations }
  published
   property iTodo : TTodo read FiTodo write SetiTodo;
  end;

var
  FRM_TODOGER: TFRM_TODOGER;

implementation

{$R *.dfm}

procedure TFRM_TODOGER.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  If iTodo.IndexName <> '' then
   iTodo.IndexName := '';
  iTodo.fClient.Active := false; 
  frm_todoger := nil;
  action := caFree;
end;

procedure TFRM_TODOGER.SetiTodo(const Value: TTodo);
begin
  FiTodo := Value;
end;

procedure TFRM_TODOGER.FormCreate(Sender: TObject);
begin
  inherited;
  iTodo :=  TTodo.create(self);
end;

procedure TFRM_TODOGER.FormShow(Sender: TObject);
begin
  inherited;
  dbg.DataSource := iTodo.DataExt;
end;

procedure TFRM_TODOGER.dbgTitleClick(Column: TColumn);

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


procedure TFRM_TODOGER.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFRM_TODOGER.sp_printClick(Sender: TObject);
begin
  inherited;
   ListPrt(dbg,'Pendências','');
end;

end.
