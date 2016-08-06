unit BST_SEGUC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls, adodb, 
  db_tier, OOSEG, baseTier, Grids, Aligrid, qt, strutils, ActnList, ToolWin, 
  ImgList;

  
type
  TFRM_SEGUC = class(TCAD_STAND)
     ID_USECASE                          : Tedit;
     D_DATATU                            : TDateTimePicker;
     DATATU                              : Tedit;
     L_DATATU                            : Tlabel;
     UC_NOME                             : Tedit;
     L_UC_NOME                           : Tlabel;
     US_DESCRICAO                        : Tedit;
     L_US_DESCRICAO                      : Tlabel;
     CLI_ID                              : Tedit;
     L_CLI_ID                            : Tlabel;
     PRJ_ID                              : Tedit;
     L_PRJ_ID                            : Tlabel;
    rdg: TRadioGroup;
    grupo: TEdit;
    UC_LING: TEdit;
    ActionList1: TActionList;
    Adicionar: TAction;
    Desfazer: TAction;
    Salvar: TAction;
    Excluir: TAction;
    Imprimir: TAction;
    Sair: TAction;
    ImageList1: TImageList;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
    procedure spb_closeClick(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure rdgClick(Sender: TObject);


  private
  
     function  consiste : boolean;
     procedure ooMap;
     

  public


  published

     property iObj;
     function  Mostra_Campos : boolean;
     procedure Mostra_Objeto(pNome : string);
     procedure LoadCOnstantObj;override;
  end;

var
  FRM_SEGUC: TFRM_SEGUC;

implementation

uses bst_dir1, bst_main;

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_SEGUC.ooMap;
{Início OOMAP}  
 begin
   If self.ID_USECASE.text ='' then 
    (iObj as OUsecase).ID_USECASE  := 0
   else
    (iObj as OUsecase).ID_USECASE  := StrtoInt(self.ID_USECASE.text);
   (iObj as OUsecase).DATATU                         := Date;
   (iObj as OUsecase).UC_NOME                        := self.UC_NOME.text;
   (iObj as OUsecase).US_DESCRICAO                   := self.US_DESCRICAO.text;
   (iObj as OUsecase).GRUPO                          := self.GRUPO.text;
   (iObj as OUsecase).UC_LING                        := self.UC_LING.text;
   (iObj as OUsecase).ddmap;
 end;
{Fim OOMAP}  
  
procedure TFRM_SEGUC.FormCreate(Sender: TObject);
var
 wdir,wfile,P1,P2: string;
 wbd : TstringList;
  begin
   inherited;
   iObj := OUsecase.create;
   (iObj as oUsecase).UC_LING := frm_main.idioma;   
 end;


  
procedure TFRM_SEGUC.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_SEGUC := nil;
   action := cafree;
 end;

  
procedure TFRM_SEGUC.FormShow(Sender: TObject);
var
i : integer;
  begin
   (iObj as ousecase).UC_LING := frm_Main.idioma;
   (iObj as ousecase).ddMap;
   Inherited;
   If lb.Count > 0 then
     begin
       lb.ItemIndex := 0;
       lbClick(nil);
       ActiveControl := lb;
     end;     
 end;      
   
procedure TFRM_SEGUC.sp2click(Sender: TObject);
  Begin
   If Status = 'I' then
      UC_LING.text := FRM_MAIN.idioma;
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OUsecase).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OUsecase).US_DESCRICAO,iObj.PK);
          Mostra_objeto(iObj.Getitem(lb)); 
        end;
      end
   else
   If Status = 'M' then
       Begin
         lb.Items[lb.ItemIndex] := (iObJ as OUsecase).US_DESCRICAO;
       end;

 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_SEGUC.Consiste : boolean;
 begin
   inherited;
   result := true;
    
    If self.UC_NOME.text ='' then 
         raise exception.create('Informar o campo Use Case');
    If self.US_DESCRICAO.text ='' then
         raise exception.create('Informar o campo Descrição');

    If self.GRUPO.text ='' then
         raise exception.create('Informar o Grupo');
 end;


{ Popula os campos Edit com os atributos da TABELA} 
function TFRM_SEGUC.Mostra_Campos : boolean;
var
i : integer;
 begin
   (iObj as OUsecase).GetProperties;
   self.ID_USECASE.text               := InttoStr((iObj as OUsecase).ID_USECASE);
   self.DATATU.text                   := DatetoStr((iObj as OUsecase).DATATU);
   self.UC_NOME.text                  := (iObj as OUsecase).UC_NOME;
   self.US_DESCRICAO.text             := (iObj as OUsecase).US_DESCRICAO;
   self.grupo.Text                    := (iObj as OUsecase).GRUPO;
   self.UC_LING.Text                  := (iObj as OUsecase).UC_LING;
   for i :=0 to rdg.Items.Count - 1 do
    Begin
     If grupo.text = rdg.Items[i] then
       rdg.ItemIndex := i;
    end;
 end;

{ Popula os campos Edit com os atributos da tabela}
procedure TFRM_SEGUC.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   //spb_del.Enabled := true;
   //sp_Insert.Enabled := true;
 end;

{ Cria o click do ListBox}
procedure TFRM_SEGUC.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;


procedure TFRM_SEGUC.DateClose(sender : TObject);
  begin;
   inherited;
   If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATATU' then
    begin
          DATATU.text := DateToStr(TDatetimePicker(sender as Tobject).date);
          exit;
    end;
  end; 


    
{Evento do Elimina}
procedure TFRM_SEGUC.spb_closeClick(Sender: TObject);
begin
  inherited;
  //close;
end;

procedure TFRM_SEGUC.sp_insertClick(Sender: TObject);
begin
  inherited;
  activeControl := uc_nome;
end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.fl.Mask := '*.dfm';
  frm_diretorio.dl.Directory := ExtractFileDir(application.ExeName);
 // frm_diretorio.ShowModal;

end;







procedure TFRM_SEGUC.rdgClick(Sender: TObject);
begin
  inherited;
  self.grupo.Text := rdg.Items[rdg.itemindex];
end;

procedure TFRM_SEGUC.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
end;  

end.
