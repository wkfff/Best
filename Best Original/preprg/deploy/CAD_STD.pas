unit CAD_STD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask, Grids, DBGrids,
  Dialogs, ImgList, ToolWin,Activex, frm_prim, Menus,aligrid,basetier;



type
  TCAD_STD = class(Tprim)
    Panel3: TPanel;
    sp2: TSpeedButton;
    sp_print: TSpeedButton;
    sp_insert: TSpeedButton;
    spb_del: TSpeedButton;
    spb_close: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Elimina1: TMenuItem;
    lb: TListBox;
    LTot: TLabel;
    procedure sp_insertClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure spb_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    


  private

    Fstatus: string;

    FAcesso: boolean;
    FTitulo: string;
    FCONSULTA: boolean;
    FiObj: TOObject;
    FComLista: boolean;

    procedure Setstatus(const Value: string);

    procedure fChange(Sender: TObject);

    procedure SetAcesso(const Value: boolean);
    procedure SetTitulo(const Value: string);
    procedure Limpa_tela;
    procedure SetiObj(const Value: TOObject);
    
    procedure SetComLista(const Value: boolean);


  protected

  


    { Private declarations }
  public
    function Limpa_campos: boolean;

  published
    property iObj : TOObject  read FiObj write SetiObj;
    property status : string read Fstatus write Setstatus;
    property Titulo : string read FTitulo write SetTitulo;
  end;


resourcestring

menscadstd1 = 'Não foi possível completar a atualização! Verifique os dados!';

var

  s : string;
  wtext : string;

implementation






{$R *.dfm}

procedure TCAD_STD.sp_insertClick(Sender: TObject);
begin
  inherited;
  sp2.enabled       := true;
  spb_del.enabled   := false;
  sp_insert.enabled := false;
  STATUS            := 'I';
  Limpa_tela;
end;

procedure TCAD_STD.Limpa_tela;
var i : integer;
Begin
  for i := 0 to componentcount -1 do
   Begin
    If Components[i] is Tedit then
     (Components[i] as Tedit).text := '';
   end;
end;

procedure TCAD_STD.sp2Click(Sender: TObject);
begin
   sp_insert.enabled := TRUE;
   spb_del.Enabled   := true;
   iObj.save;
   showmessage( iObj.resulta);
  
  inherited;
end;



procedure TCAD_STD.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;



procedure TCAD_STD.spb_closeClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TCAD_STD.fChange(Sender: TObject);
begin
  sp2.enabled := true;
 
end;



procedure TCAD_STD.FormShow(Sender: TObject);
var
i : integer;
 Begin
  status := 'M';
  iObj.GetAll;
  If iObj.lista <> nil then
    begin
     lb.items := iObj.Lista;
     lTot.Caption := 'Total : '+inttostr(lb.Items.count);
    end;

 end;


procedure TCAD_STD.SetAcesso(const Value: boolean);
begin
  FAcesso := Value;
end;

procedure TCAD_STD.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TCAD_STD.sp_printClick(Sender: TObject);
begin
  inherited;
 // ListPrt(dbgrid1,caption,'');
end;

procedure TCAD_STD.spb_delClick(Sender: TObject);
begin
  inherited;
  If lb.itemIndex < 0 then
   raise exception.create('Escolher um ítem da Lista!');
  If MessageDlg('Confirma a Eliminação ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          iObj.Delete;
          lb.Items.Delete(lb.ItemIndex);
          showmessage( iObj.resulta);
          Limpa_Campos;
       end
end;

procedure TCAD_STD.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : integer;
begin
  for i := 0 to lb.Items.Count -1 do   // destroi objetos do ítem
   begin
     If  (lb.Items.Objects[i]) <> nil then
     (lb.Items.Objects[i]).Free;
   end;

end;

{ Limpa os Tedits}
function TCAD_STD.Limpa_campos : boolean;
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

procedure TCAD_STD.SetiObj(const Value: TOObject);
begin
  FiObj := Value;
end;

procedure TCAD_STD.FormCreate(Sender: TObject);
begin
  inherited;
  iObj := TOObject.create;
  
end;


procedure TCAD_STD.SetComLista(const Value: boolean);
begin
  FComLista := Value;
end;

end.
