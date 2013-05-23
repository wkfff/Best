unit aform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,AAAA, CAD_STD, StdCtrls, Menus, Grids, DBGrids, Buttons, ExtCtrls,
  DB, ADODB;

type
  TFRM_aform = class(TCAD_STD)
l_DIR_ALIAS : Tlabel;
  DIR_ALIAS : Tedit;
l_CLI_RAZ_O_SOCIAL : Tlabel;
  CLI_RAZ_O_SOCIAL : Tedit;
l_CLI_NOME : Tlabel;
  CLI_NOME : Tedit;
l_CLI_DIR : Tlabel;
  CLI_DIR : Tedit;
l_CLI_AREA_INTERESSE : Tlabel;
  CLI_AREA_INTERESSE : Tedit;
    adoc: TADOConnection;

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
  private
  fTCliente : TCliente;
    { Private declarations }
  public
    { Public declarations }
  Published
     property iObj : TCliente read fTCliente write SetTCliente;
  end;

var
  FRM_aform: TFRM_aform;

implementation

{$R *.dfm}

procedure TFRM_aform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRM_aform := nil;
  action := cafree;
end;

procedure TFRM_aform.SetTCliente ( value : TCliente) ;
  begin
    fTCliente:= value;
  end;
  
procedure TFRM_aform.FormCreate(Sender: TObject);
  begin;
   inherited;
    iObj := TCliente.create(self);
    iObj.Get_All;
  end; 


    
procedure TFRM_aform.FormShow(Sender: TObject);
 begin
   inherited;
   Dbgrid1.Datasource := iObj.dataext;
   If not iObj.eof then 
     Dbgrid1CellClick(nil);
 end;
  

   
{Evento do Botão Confirma master}
procedure TFRM_aform.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   With TCliente.create(self) do
     begin
      CLI_AREA_INTERESSE := self.CLI_AREA_INTERESSE.text;
      CLI_DIR := self.CLI_DIR.text;
      CLI_NOME := self.CLI_NOME.text;
      CLI_RAZ_O_SOCIAL := self.CLI_RAZ_O_SOCIAL.text;
      DIR_ALIAS := self.DIR_ALIAS.text;
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
function TFRM_aform.Consiste : boolean;
 begin
   inherited;
   result := true;
    If CLI_AREA_INTERESSE.text ='' then 
         raise exception.create('Informar o campo Area de Interesse');
    If CLI_DIR.text ='' then 
         raise exception.create('Informar o campo Diretório');
    If CLI_NOME.text ='' then 
         raise exception.create('Informar o campo Nome');
    If CLI_RAZ_O_SOCIAL.text ='' then 
         raise exception.create('Informar o campo Razão Social');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_aform.Mostra_Campos : boolean;
 begin
   CLI_AREA_INTERESSE.text  := iObj.CLI_AREA_INTERESSE;
   CLI_DIR.text             := iObj.CLI_DIR;
   CLI_NOME.text            := iObj.CLI_NOME;
   CLI_RAZ_O_SOCIAL.text    := iObj.CLI_RAZ_O_SOCIAL;
   DIR_ALIAS.text           := iObj.DIR_ALIAS;
 end;
  
  
procedure TFRM_aform. DBGrid1CellClick(Column: TColumn);
  begin;
   inherited;
   Mostra_campos;
  end; 


   
{ Limpa os Tedits} 
function TFRM_aform.Limpa_campos : boolean;
 begin
   inherited;
     CLI_AREA_INTERESSE.text   := '';
     CLI_DIR.text              := '';
     CLI_NOME.text             := '';
     CLI_RAZ_O_SOCIAL.text     := '';
     DIR_ALIAS.text            := '';
 end;
  

{Evento do Close Up datetimePicker}
procedure TFRM_aform.DateClose(sender : TObject);
 Begin
 end;
  
    
{Evento do Elimina}
procedure TFRM_aform.spb_delClick(Sender: TObject);
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
  

end.
