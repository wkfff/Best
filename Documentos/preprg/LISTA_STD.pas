unit LISTA_STD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask, Grids, DBGrids,
  Dialogs, ImgList, ToolWin,Activex, frm_prim, Menus,basetier,aligrid;



type
  TLISTA_STD = class(Tprim)
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
    procedure spb_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private

    Fstatus: string;

    FAcesso: boolean;
    FTitulo: string;
    FCONSULTA: boolean;
    FiObj: TOObject;

    procedure Setstatus(const Value: string);

    procedure fChange(Sender: TObject);

    procedure SetAcesso(const Value: boolean);
    procedure SetTitulo(const Value: string);
    procedure Limpa_tela;
    procedure SetiObj(const Value: TOObject);
    function Limpa_campos: boolean;

  protected

  property iObj : TOObject  read FiObj write SetiObj;

    { Private declarations }
  public


  published
    property status : string read Fstatus write Setstatus;
    property Titulo : string read FTitulo write SetTitulo;

  end;




var

  s : string;


implementation





{$R *.dfm}





procedure TLISTA_STD.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;



procedure TLISTA_STD.spb_closeClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TLISTA_STD.fChange(Sender: TObject);
begin
  sp2.enabled := true;
 
end;



procedure TLISTA_STD.FormShow(Sender: TObject);
var
i : integer;
 Begin
  status := 'M';
   showmessage((sender as TObject).ClassName) ;
  iObj.GetAll;
  If iObj.lista <> nil then
    begin
     lb.items := iObj.Lista;
     lTot.Caption := 'Total : '+inttostr(lb.Items.count);
    end;

 end;


procedure TLISTA_STD.SetAcesso(const Value: boolean);
begin
  FAcesso := Value;
end;

procedure TLISTA_STD.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TLISTA_STD.sp_printClick(Sender: TObject);
begin
  inherited;
 // ListPrt(dbgrid1,caption,'');
end;


procedure TLISTA_STD.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : integer;
begin
  for i := 0 to lb.Items.Count -1 do   // destroi objetos do ítem
   begin
     If  (lb.Items.Objects[i]) <> nil then
     (lb.Items.Objects[i]).Free;
   end;

end;


procedure TLISTA_STD.SetiObj(const Value: TOObject);
begin
  FiObj := Value;
end;

procedure TLISTA_STD.FormCreate(Sender: TObject);
begin
  inherited;
  iObj := TOObject.create;
end;

end.
