unit acli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,BBB, CAD_STD, StdCtrls, Menus, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFRM_acli = class(TCAD_STD)
     l_DIR_ALIAS                         : Tlabel;
     DIR_ALIAS                           : Tedit;
     l_CLI_RAZ_O_SOCIAL                  : Tlabel;
     CLI_RAZ_O_SOCIAL                    : Tedit;
     l_CLI_NOME                          : Tlabel;
     CLI_NOME                            : Tedit;
     l_CLI_DIR                           : Tlabel;
     CLI_DIR                             : Tedit;
     l_CLI_AREA_INTERESSE                : Tlabel;
     CLI_AREA_INTERESSE                  : Tedit;
    SpeedButton1: TSpeedButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure DBGrid1CellClick(Column: TColumn);
  procedure DateClose(sender : Tobject);
  function Limpa_Campos : boolean;
  Procedure spb_delClick(sender : TObject);
  function Mostra_Campos : boolean;
  function consiste : boolean;
  procedure sp2click(Sender: TObject);
  procedure FormShow(Sender : Tobject);
  procedure FormCreate (Sender : Tobject);
  procedure SetTCliente (value : TCliente);
    procedure SpeedButton1Click(Sender: TObject);
  private
      fTCliente                           : TCliente;
    { Private declarations }
  public
    { Public declarations }
  Published
     property iObj : TCliente read fTCliente write SetTCliente;
  end;

var
  FRM_acli: TFRM_acli;

implementation

uses aproj;

{$R *.dfm}

procedure TFRM_acli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRM_acli := nil;
  action := cafree;
end;

procedure TFRM_acli.SetTCliente ( value : TCliente) ;
  begin
    fTCliente:= value;
  end;

procedure TFRM_acli.FormCreate(Sender: TObject);
  begin;
   inherited;
    iObj := TCliente.create(self);
    iObj.Get_All();
  end;



procedure TFRM_acli.FormShow(Sender: TObject);
 begin
   inherited;
   Dbgrid1.Datasource := iObj.dataext;
   If not iObj.eof then
     Dbgrid1CellClick(nil);
 end;



{Evento do Botão Confirma master}
procedure TFRM_acli.sp2click(Sender: TObject);
  Begin
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   With TCliente.create(self) do
     begin
      CLI_AREA_INTERESSE                  := self.CLI_AREA_INTERESSE.text;
      CLI_DIR                             := self.CLI_DIR.text;
      CLI_NOME                            := self.CLI_NOME.text;
      CLI_RAZ_O_SOCIAL                    := self.CLI_RAZ_O_SOCIAL.text;
      DIR_ALIAS                           := self.DIR_ALIAS.text;
      If Self.STATUS = 'I' then
         Inclui
     else
      If Self.STATUS = 'M' then
          Atualiza(iObj.CLI_ID);
      free;
   end;
  iObj.close;
  iObj.Open;
  If not iObj.eof then
     Dbgrid1Cellclick(nil);
  inherited;
 end;



{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização}
function TFRM_acli.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.CLI_AREA_INTERESSE.text ='' then
         raise exception.create('Informar o campo Area de Interesse');
    If self.CLI_DIR.text ='' then
         raise exception.create('Informar o campo Diretório');
    If self.CLI_NOME.text ='' then
         raise exception.create('Informar o campo Nome');
    If self.CLI_RAZ_O_SOCIAL.text ='' then
         raise exception.create('Informar o campo Razão Social');
 end;


{ Popula os campos Edit com os atributos da tabela}
function TFRM_acli.Mostra_Campos : boolean;
 begin
   self.CLI_AREA_INTERESSE.text       := iObj.CLI_AREA_INTERESSE;
   self.CLI_DIR.text                  := iObj.CLI_DIR;
   self.CLI_NOME.text                 := iObj.CLI_NOME;
   self.CLI_RAZ_O_SOCIAL.text         := iObj.CLI_RAZ_O_SOCIAL;
   self.DIR_ALIAS.text                := iObj.DIR_ALIAS;
 end;


procedure TFRM_acli. DBGrid1CellClick(Column: TColumn);
  begin;
   inherited;
   Mostra_campos;
  
  end;


   
{ Limpa os Tedits} 
function TFRM_acli.Limpa_campos : boolean;
 begin
   inherited;
     self.CLI_AREA_INTERESSE.text        := '';
     self.CLI_DIR.text                   := '';
     self.CLI_NOME.text                  := '';
     self.CLI_RAZ_O_SOCIAL.text          := '';
     self.DIR_ALIAS.text                 := '';
 end;
  

{Evento do Close Up datetimePicker}
procedure TFRM_acli.DateClose(sender : TObject);
 Begin
 end;
  
    
{Evento do Elimina}
procedure TFRM_acli.spb_delClick(Sender: TObject);
  begin
      If MessageDlg('Confirma a Eliminação ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then 
        begin
          With TCliente.create(self) do
           try
            begin
              If not Delete_Object(iObj.CLI_ID) then
                Raise exception.create('Não foi possível Eliminar!');
            end;
           finally
            free;
           end;
        end;
   iObj.close;
   iObj.Open;
  If not iObj.eof then 
     Dbgrid1Cellclick(nil)
  else 
     Limpa_Campos;
   inherited;
 end;
  

procedure TFRM_acli.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if frm_aproj = nil then
    begin
     frm_aproj := TFrm_aproj.create(self);
     frm_aproj.iObj.cli_id := iobj.cli_id;
     frm_aproj.showModal;
    end;
end;

end.
