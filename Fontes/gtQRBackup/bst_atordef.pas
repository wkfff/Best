unit bst_atordef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, DBCtrls,bstdb,cls_obj,bst_Objetos, ComCtrls, StdCtrls,
  Buttons, ActnList, ImgList, ToolWin;

type
  Tfrm_atordef = class(Tprim)
    trv_ator: TTreeView;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    trv_loc: TTreeView;
    SpeedButton1: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Salvar: TAction;
    Sair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trv_atorClick(Sender: TObject);
    procedure trv_locClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SairExecute(Sender: TObject);
  private
    FiAtor: Tdados_tab;
    Fcliente: integer;
    Fcenario: integer;
    FiLoc: Tdados_Tab;
    procedure SetiAtor(const Value: Tdados_tab);
    procedure Setcenario(const Value: integer);
    procedure Setcliente(const Value: integer);
    procedure SetiLoc(const Value: Tdados_Tab);
    
    { Private declarations }
  public
     procedure LoadConstantObj; override;
  published
   property iAtor : Tdados_tab read FiAtor write SetiAtor;
   property iLoc : Tdados_Tab read FiLoc write SetiLoc;
   property cliente : integer read Fcliente write Setcliente;
   property cenario : integer read Fcenario write Setcenario;
  end;

var
  frm_atordef: Tfrm_atordef;

implementation

uses bst_treeAtiv, bst_main;

{$R *.dfm}

procedure Tfrm_atordef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If edit2.Text <> '' then
   Begin
     frm_treeativ.atordefdesc := edit1.Text;
     frm_treeativ.ATORDEF     := strtoint(edit2.Text);
   end;
  If edit3.Text <> ''then
   Begin
     frm_treeativ.localdefdesc := edit4.Text;
     frm_treeativ.LOCALDEF     :=  strtoint(edit3.Text);
   end;


   

frm_atordef := nil;
action := caFree;
end;

procedure Tfrm_atordef.SetiAtor(const Value: Tdados_tab);
begin
  FiAtor := Value;
end;

procedure Tfrm_atordef.FormCreate(Sender: TObject);
begin
  inherited;
   iAtor :=  TDados_tab.create(self);
   iLoc  := TDados_tab.create(self);
end;
procedure Tfrm_atordef.Setcenario(const Value: integer);
begin
  Fcenario := Value;
end;

procedure Tfrm_atordef.Setcliente(const Value: integer);
begin
  Fcliente := Value;
end;

procedure Tfrm_atordef.FormShow(Sender: TObject);
begin
  inherited;
  iAtor.OpenAllbyDesc(cliente,cenario,'IDF_CA','','');
  iator.Cria_lista(trv_ator, false,true);

  iLoc.OpenAllbyDesc(cliente,cenario,'IDF_LF','','');
  iloc.Cria_lista(trv_loc, false,true);

  edit1.Text := frm_treeativ.atordefdesc;
  edit2.Text := inttostr(frm_treeativ.atordef);
  edit3.Text := inttostr(frm_treeativ.LOCALDEF);
  edit4.Text := frm_treeativ.localdefdesc;

end;

procedure Tfrm_atordef.trv_atorClick(Sender: TObject);
begin
  inherited;
  If trv_ator.Selected <> nil then
   Begin
     edit1.Text := trv_ator.Selected.text;
     edit2.Text :=  uObj(trv_ator.Selected.data)^.Fcodigo;
   end;
     
end;

procedure Tfrm_atordef.SetiLoc(const Value: Tdados_Tab);
begin
  FiLoc := Value;
end;

procedure Tfrm_atordef.trv_locClick(Sender: TObject);
begin
  inherited;
    If trv_loc.Selected <> nil then
     Begin
       edit4.Text := trv_loc.Selected.text;
       edit3.text := uObj(trv_loc.Selected.data)^.Fcodigo;
     end;
    
end;

procedure Tfrm_atordef.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_atordef.LoadConstantObj;
begin

inherited ;

  Caption              := 'Default';//'Valores Default Diagrama'  ;
  Label1.Caption       := def1000+' Default';//'Ator Default .'  ;
  Label2.Caption       := def30 +' Default';//'Local de Processamento Default'  ;
  SpeedButton1.Caption := def903;//'Confirma'  ;

end;


procedure Tfrm_atordef.SairExecute(Sender: TObject);
begin
  inherited;
  close;
end;

end.
