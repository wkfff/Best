unit BST_ALIAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,OO_BEST, CAD_STD, StdCtrls, Menus, Buttons, ExtCtrls;

type
  TFRM_ALIAS = class(TCAD_STD)
       IDF_CODIGO                          : Tedit;
     L_IDF_CODIGO                        : Tlabel;
     IDF_ALIAS                           : Tedit;
     L_IDF_ALIAS                         : Tlabel;
     IDF_DIRETORIO                       : Tedit;
     L_IDF_DIRETORIO                     : Tlabel;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);


  { Private declarations }
  private
     procedure Mostra_Objeto(pNome : string);
     function  consiste : boolean;
     procedure ooMap;

  
   { Public declarations }
  public

    { Published declarations }
  published
     property iObj; 
     function  Mostra_Campos : boolean;

   
  end;

var
  FRM_ALIAS: TFRM_ALIAS;

implementation

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_ALIAS.ooMap;
 begin
    If self.IDF_CODIGO.text = '' then
      (iObj as OAliass).IDF_CODIGO        := 0 
    else
      (iObj as OAliass).IDF_CODIGO       := StrtoInt(self.IDF_CODIGO.text);
   (iObj as OAliass).IDF_ALIAS        := self.IDF_ALIAS.text;
   (iObj as OAliass).IDF_DIRETORIO    := self.IDF_DIRETORIO.text;
   (iObj as OAliass).ddmap;
 end;
  
  
procedure TFRM_ALIAS.FormCreate(Sender: TObject);
  begin;
   inherited;
   iObj := OAliass.create;
 end;


  
procedure TFRM_ALIAS.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_ALIAS := nil;
   action := cafree;
 end;

  
procedure TFRM_ALIAS.FormShow(Sender: TObject);
  begin;
   Inherited;
   iObj := OAliass.create;
 end;

   
procedure TFRM_ALIAS.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OAliass).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OAliass).IDF_ALIAS,iObj.PK);
        end;
      end
   else 
        begin 
         lb.Items[lb.ItemIndex] := (iObJ as OAliass).IDF_ALIAS
        end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_ALIAS.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.IDF_ALIAS.text ='' then 
         raise exception.create('Informar o campo Alias');
    If self.IDF_DIRETORIO.text ='' then 
         raise exception.create('Informar o campo Diretório');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_ALIAS.Mostra_Campos : boolean;
 begin
   (iObj as OAliass).GetProperties;
   self.IDF_CODIGO.text               := InttoStr((iObj as OAliass).IDF_CODIGO);
   self.IDF_ALIAS.text                := (iObj as OAliass).IDF_ALIAS;
   self.IDF_DIRETORIO.text            := (iObj as OAliass).IDF_DIRETORIO;
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_ALIAS.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_ALIAS.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
{Evento do Close Up datetimePicker}
procedure TFRM_ALIAS.DateClose(sender : TObject);
 Begin
 end;
  
    
{Evento do Elimina}
end.
