unit CAD_STAND;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask, Grids, DBGrids,
  Dialogs, ImgList, ToolWin,Activex, Menus,basetier,aligrid,
  frm_primar,bst_idiomas,bstdb, ActnList;



type
  TCAD_STAND = class(Tprimar)
    PopupMenu1: TPopupMenu;
    Elimina1: TMenuItem;
    LTot: TLabel;
    Panel1: TPanel;
    lb: TListBox;
    sp_insertDet: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ImageList2: TImageList;
    ActionList2: TActionList;
    grid_cont : TStringAlignGrid;
    Add: TAction;
    Undo: TAction;
    Save: TAction;
    Delete: TAction;
    Print: TAction;
    Close: TAction;
    procedure sp_insertClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure spb_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lbClick(Sender: TObject);
    procedure CloseHint(var HintStr: String; var CanShow: Boolean);
   
  private

    Fstatus: string;

    FAcesso: boolean;
    FTitulo: string;
    FCONSULTA: boolean;
    FiObj: TOObject;
    FComLista: boolean;
    FType_Form: integer;
    FKey_master: integer;
    FKey_Detail: integer;


    procedure Setstatus(const Value: string);
    procedure fChange(Sender: TObject);
    procedure SetAcesso(const Value: boolean);
    procedure SetTitulo(const Value: string);
    procedure Limpa_tela;
    procedure SetiObj(const Value: TOObject);
    procedure SetComLista(const Value: boolean);
    procedure SetType_Form(const Value: integer);
    procedure SetKey_Detail(const Value: integer);
    procedure SetKey_master(const Value: integer);
    

  protected
  procedure LoadConstantobj; virtual;abstract;
    { Private declarations }
  public
    function Limpa_campos: boolean;
    procedure LoadConstant;virtual;
  published
    property iObj : TOObject  read FiObj write SetiObj;
    property status : string read Fstatus write Setstatus;
    property Titulo : string read FTitulo write SetTitulo;
    { define se mostra o listbox de todos os objetos}
    property Type_Form : integer read FType_Form write SetType_Form ;
    property Key_master : integer read FKey_master write SetKey_master; //key do master
    property Key_Detail : integer read FKey_Detail write SetKey_Detail; //key do detail
    procedure Limpa_grid(pList: TStringAlignGrid);

  end;


  
   



resourcestring

menscadstd1 = 'Não foi possível completar a atualização! Verifique os dados!';

var

  s : string;
  wtext : string;
  larg_ant,alt_ant,top_ant,left_ant : integer;

implementation

uses bst_main;

{$R *.dfm}

procedure TCAD_STAND.LoadConstant;
 Begin
    LoadConstantobj;
 end;



procedure TCAD_STAND.sp_insertClick(Sender: TObject);
begin
  inherited;
  //sp2.enabled       := true;
  //spb_del.enabled   := false;
  //sp_insert.enabled := false;
  STATUS            := 'I';
  Limpa_tela;
  Limpa_grid(Grid_cont);
end;

procedure TCAD_STAND.Limpa_tela;
var i : integer;
Begin
  for i := 0 to componentcount -1 do
   Begin
    If Components[i] is Tedit then
     (Components[i] as Tedit).text := '';
   end;
end;

procedure TCAD_STAND.sp2Click(Sender: TObject);
begin
   //sp_insert.enabled := TRUE;
   //spb_del.Enabled   := true;
   iObj.save;
  // showmessage( iObj.resulta);
  inherited;
end;



procedure TCAD_STAND.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;


procedure TCAD_STAND.spb_closeClick(Sender: TObject);
begin
  inherited;
  //close;
end;

procedure TCAD_STAND.fChange(Sender: TObject);
begin
  //sp2.enabled := true;
end;

procedure TCAD_STAND.FormShow(Sender: TObject);
var
i : integer;
 Begin
   Ling(frm_main.Idioma,self) ;

        
  If Status <> 'I' then
     status := 'M';
  If Type_form = 0 then  // todas as empresas
  begin
    
    iObj.GetAll;
    If iObj.lista <> nil then
      begin
       lb.items := iObj.Lista;
       lTot.Caption := 'Total : '+inttostr(lb.Items.count);
      end;
  end
 else      // mostra apenas uma instância (sem listbox das empresas)
  begin
   lb.visible := false;
   for i := 0 to ControlCount-1 do
      Controls[i].Left :=  Controls[i].Left - lb.width;
   width := width - lb.width;
   //sp2.Left := sp2.Left - lb.width;
  end;
 end;


procedure TCAD_STAND.SetAcesso(const Value: boolean);
begin
  FAcesso := Value;
end;

procedure TCAD_STAND.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TCAD_STAND.sp_printClick(Sender: TObject);
begin
  inherited;
 // ListPrt(dbgrid1,caption,'');
end;

procedure TCAD_STAND.spb_delClick(Sender: TObject);
begin
  inherited;

  If Type_form = 0 then // instancia múltipla (com listbox)
   begin
      If lb.itemIndex < 0 then
        raise exception.create('Escolher um ítem da Lista!');
   end;
   If MessageDlg('Confirma a Eliminação ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin

          iObj.Delete;
          If Type_form = 0 then // instancia múltipla (com listbox)
             lb.Items.Delete(lb.ItemIndex);
          showmessage( iObj.resulta);
          Limpa_Campos;
       end
end;

procedure TCAD_STAND.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : integer;
begin
  {If Type_form = 0 then
    Begin
      for i := 0 to lb.Items.Count -1 do   // destroi objetos do ítem
         begin
           If  (lb.Items.Objects[i]) <> nil then
           (lb.Items.Objects[i]).free;
         end;
    end;}
  

end;

{ Limpa os Tedits}
function TCAD_STAND.Limpa_campos : boolean;
var
i : integer;
 begin
   inherited;
     for i := 0 to componentCount -1 do
      begin
       If Components[i] is Tedit then
          (Components[i] as Tedit).Text := '';
      end;
 end;

procedure TCAD_STAND.Limpa_grid(pList : TStringAlignGrid);  //somente master
var
i,j,m,n : integer;
begin
  j := pList.FixedCols ;
  i := pList.FixedRows;
  for m := i to pList.RowCount-1 do
   begin
     for n := j to pList.ColCount-1 do
      pList.cells[n,m] := '';
   end;
end;


procedure TCAD_STAND.SetiObj(const Value: TOObject);
begin
  FiObj := Value;
end;

procedure TCAD_STAND.FormCreate(Sender: TObject);
begin
  inherited;
  iObj := TOObject.create;
  {master/detail}
  grid_cont.DefaultRowHeight := 20;
  
end;


procedure TCAD_STAND.SetComLista(const Value: boolean);
begin
  FComLista := Value;
end;

procedure TCAD_STAND.lbClick(Sender: TObject);
begin
  inherited;
  limpa_campos;
end;

procedure TCAD_STAND.SetType_Form(const Value: integer);
begin
  FType_Form := Value;
end;

procedure TCAD_STAND.SetKey_Detail(const Value: integer);
begin
  FKey_Detail := Value;
end;

procedure TCAD_STAND.SetKey_master(const Value: integer);
begin
  FKey_master := Value;
end;



procedure TCAD_STAND.CloseHint(var HintStr: String; var CanShow: Boolean);
begin
  inherited;
  //Close;
end;

end.
