unit aproj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,BBB, CAD_STD, ComCtrls, StdCtrls, Menus, Grids, DBGrids, Buttons,
  ExtCtrls,DB;

type
  TFRM_aproj = class(TCAD_STD)
     l_PRJ_STATUS                        : Tlabel;
     PRJ_STATUS                          : Tedit;
     l_PRJ_ALVOS_MELHORIA                : Tlabel;
     PRJ_ALVOS_MELHORIA                  : TMemo;
     l_PRJ_RESTRICOES                    : Tlabel;
     PRJ_RESTRICOES                      : TMemo;
     l_PRJ_PREMISSAS                     : Tlabel;
     PRJ_PREMISSAS                       : TMemo;
     l_PRJ_PATH                          : Tlabel;
     PRJ_PATH                            : Tedit;
     l_PRJ_OBJETIVO                      : Tlabel;
     PRJ_OBJETIVO                        : TMemo;
     l_PRJ_FATORES_RESTRITIVOS           : Tlabel;
     PRJ_FATORES_RESTRITIVOS             : TMemo;
     l_PRJ_DEFINICAO_CONTEXTO            : Tlabel;
     PRJ_DEFINICAO_CONTEXTO              : TMemo;
     l_PRJ_DATA_FIM_PLANEJADA            : Tlabel;
     PRJ_DATA_FIM_PLANEJADA              : Tedit;
     d_PRJ_DATA_FIM_PLANEJADA            : TDateTimePicker;
     l_PRJ_CARATER_RELEVANTE             : Tlabel;
     PRJ_CARATER_RELEVANTE               : TMemo;
     l_PRJ_CAMINHO                       : Tlabel;
     PRJ_CAMINHO                         : Tedit;
     l_PRJ_AREA_INTERESSE                : Tlabel;
     PRJ_AREA_INTERESSE                  : Tedit;
     l_PRJ_TITULO                        : Tlabel;
     PRJ_TITULO                          : Tedit;

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
  procedure SetTCenario (value : TCenario);
  private
      fTCenario                           : TCenario;
    { Private declarations }
  public
    { Public declarations }
  Published
     property iObj : TCenario read fTCenario write SetTCenario;
  end;

var
  FRM_aproj: TFRM_aproj;

implementation

{$R *.dfm}

procedure TFRM_aproj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRM_aproj := nil;
  action := cafree;
end;

procedure TFRM_aproj.SetTCenario ( value : TCenario) ;
  begin
    fTCenario:= value;
  end;
  
procedure TFRM_aproj.FormCreate(Sender: TObject);
  begin;
   inherited;
    iObj := TCenario.create(self);
  end; 


    
procedure TFRM_aproj.FormShow(Sender: TObject);
 begin
   inherited;
   iObj.Get_All(iObj.CLI_ID);
   Dbgrid1.Datasource := iObj.dataext;
   If not iObj.eof then 
     Dbgrid1CellClick(nil);
 end;
  

   
{Evento do Botão Confirma master}
procedure TFRM_aproj.sp2click(Sender: TObject);

  Begin
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   With TCenario.create(self) do
     begin
      PRJ_TITULO                          := self.PRJ_TITULO.text;
      PRJ_AREA_INTERESSE                  := self.PRJ_AREA_INTERESSE.text;
      PRJ_CAMINHO                         := self.PRJ_CAMINHO.text;
      PRJ_CARATER_RELEVANTE               := self.PRJ_CARATER_RELEVANTE.text;
      If self.PRJ_DATA_FIM_PLANEJADA.text <> '' then
        PRJ_DATA_FIM_PLANEJADA              := STRTODATE(self.PRJ_DATA_FIM_PLANEJADA.text);
      PRJ_DEFINICAO_CONTEXTO              := self.PRJ_DEFINICAO_CONTEXTO.text;
      PRJ_FATORES_RESTRITIVOS             := self.PRJ_FATORES_RESTRITIVOS.text;
      PRJ_OBJETIVO                        := self.PRJ_OBJETIVO.text;
      PRJ_PATH                            := self.PRJ_PATH.text;
      PRJ_PREMISSAS                       := self.PRJ_PREMISSAS.text;
      PRJ_RESTRICOES                      := self.PRJ_RESTRICOES.text;
      PRJ_ALVOS_MELHORIA                  := self.PRJ_ALVOS_MELHORIA.text;
      PRJ_STATUS                          := self.PRJ_STATUS.text;
        CLI_ID                              := iObj.CLI_ID;
      If Self.STATUS = 'I' then
         begin
           Inclui ;
           iObj.PRJ_ID := prj_id;

         end

     else
      If Self.STATUS = 'M' then
          Atualiza(iObj.CLI_ID,iObj.PRJ_ID);
      free;
   end;
   iObj.close;
   iObj.Open;
   dbgrid1.DataSource.DataSet.Refresh;
   iObj.Locate('CLI_ID;PRJ_ID',varArrayOf([iObj.cli_id,iObj.prj_id]),[loCaseInsensitive]);
  If not iObj.eof then
     Dbgrid1Cellclick(nil);
  inherited;
 end;


   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_aproj.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.PRJ_TITULO.text ='' then 
         raise exception.create('Informar o campo Nome Cenário');
    If self.PRJ_AREA_INTERESSE.text ='' then 
         raise exception.create('Informar o campo Área de Interesse');
    If self.PRJ_CAMINHO.text ='' then 
         raise exception.create('Informar o campo Diretório Padrão');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_aproj.Mostra_Campos : boolean;
 begin
   self.PRJ_TITULO.text               := iObj.PRJ_TITULO;
   self.PRJ_AREA_INTERESSE.text       := iObj.PRJ_AREA_INTERESSE;
   self.PRJ_CAMINHO.text              := iObj.PRJ_CAMINHO;
   self.PRJ_CARATER_RELEVANTE.text    := iObj.PRJ_CARATER_RELEVANTE;
   self.PRJ_DATA_FIM_PLANEJADA.text   := DatetoStr(iObj.PRJ_DATA_FIM_PLANEJADA);
   self.PRJ_DEFINICAO_CONTEXTO.text   := iObj.PRJ_DEFINICAO_CONTEXTO;
   self.PRJ_FATORES_RESTRITIVOS.text  := iObj.PRJ_FATORES_RESTRITIVOS;
   self.PRJ_OBJETIVO.text             := iObj.PRJ_OBJETIVO;
   self.PRJ_PATH.text                 := iObj.PRJ_PATH;
   self.PRJ_PREMISSAS.text            := iObj.PRJ_PREMISSAS;
   self.PRJ_RESTRICOES.text           := iObj.PRJ_RESTRICOES;
   self.PRJ_ALVOS_MELHORIA.text       := iObj.PRJ_ALVOS_MELHORIA;
   self.PRJ_STATUS.text               := iObj.PRJ_STATUS;
 end;
  
  
procedure TFRM_aproj. DBGrid1CellClick(Column: TColumn);
  begin;
   inherited;
   Mostra_campos;
  end; 


   
{ Limpa os Tedits} 
function TFRM_aproj.Limpa_campos : boolean;
 begin
   inherited;
     self.PRJ_TITULO.text                := '';
     self.PRJ_AREA_INTERESSE.text        := '';
     self.PRJ_CAMINHO.text               := '';
     self.PRJ_CARATER_RELEVANTE.text     := '';
     self.PRJ_DATA_FIM_PLANEJADA.text    := '';
     self.PRJ_DEFINICAO_CONTEXTO.text    := '';
     self.PRJ_FATORES_RESTRITIVOS.text   := '';
     self.PRJ_OBJETIVO.text              := '';
     self.PRJ_PATH.text                  := '';
     self.PRJ_PREMISSAS.text             := '';
     self.PRJ_RESTRICOES.text            := '';
     self.PRJ_ALVOS_MELHORIA.text        := '';
     self.PRJ_STATUS.text                := '';
 end;


{Evento do Close Up datetimePicker}
procedure TFRM_aproj.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_PRJ_DATA_FIM_PLANEJADA' then 
      begin
            PRJ_DATA_FIM_PLANEJADA.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;
  
    
{Evento do Elimina}
procedure TFRM_aproj.spb_delClick(Sender: TObject);
  begin
      If MessageDlg('Confirma a Eliminação ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then 
        begin
          With TCenario.create(self) do
           try
            begin
              If not Delete_Object(iObj.CLI_ID,iObj.PRJ_ID) then
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
