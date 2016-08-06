unit BST_MTD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,OO_BEST, CAD_STD, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls;

type
  TFRM_BST_MTD = class(TCAD_STD)
     CLI_ID                              : Tedit;
     L_CLI_ID                            : Tlabel;
     PRJ_ID                              : Tedit;
     L_PRJ_ID                            : Tlabel;
     IDF_CODIGO                          : Tedit;
     L_IDF_CODIGO                        : Tlabel;
     CLASS_ID                            : Tedit;
     L_CLASS_ID                          : Tlabel;
     IDF_SEQ                             : Tedit;
     L_IDF_SEQ                           : Tlabel;
     IDF_CAT                             : Tedit;
     L_IDF_CAT                           : Tlabel;
     IDF_DESIGNACAO                      : Tedit;
     L_IDF_DESIGNACAO                    : Tlabel;
     IDF_DIRETORIO                       : Tedit;
     L_IDF_DIRETORIO                     : Tlabel;
     IDF_METBIND                         : Tedit;
     L_IDF_METBIND                       : Tlabel;
     IDF_METDIRECT                       : Tedit;
     L_IDF_METDIRECT                     : Tlabel;
     IDF_METTYPE                         : Tedit;
     L_IDF_METTYPE                       : Tlabel;
     IDF_OBJETIVO                        : Tedit;
     L_IDF_OBJETIVO                      : Tlabel;
     IDF_RESPONSAVEL                     : Tedit;
     L_IDF_RESPONSAVEL                   : Tlabel;
     IDF_TIPO                            : Tedit;
     L_IDF_TIPO                          : Tlabel;
     IDF_VERSAO                          : Tedit;
     L_IDF_VERSAO                        : Tlabel;
     D_IDF_VERSAO_DATA                   : TDateTimePicker;
     IDF_VERSAO_DATA                     : Tedit;
     L_IDF_VERSAO_DATA                   : Tlabel;
     MET_COMENT                          : Tedit;
     L_MET_COMENT                        : Tlabel;
     MET_NOME                            : Tedit;
     L_MET_NOME                          : Tlabel;
     MET_VISIBIL                         : Tedit;
     L_MET_VISIBIL                       : Tlabel;

   
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
     property iMtd; 
     function  Mostra_Campos : boolean;

   
  end;

var
  FRM_BST_MTD: TFRM_BST_MTD;

implementation

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_BST_MTD.ooMap;
 begin
    If self.CLI_ID.text = '' then
      (iMtd as OMetodos).CLI_ID           := 0 
    else
      (iMtd as OMetodos).CLI_ID          := StrtoInt(self.CLI_ID.text);
    If self.PRJ_ID.text = '' then
      (iMtd as OMetodos).PRJ_ID           := 0 
    else
      (iMtd as OMetodos).PRJ_ID          := StrtoInt(self.PRJ_ID.text);
    If self.IDF_CODIGO.text = '' then
      (iMtd as OMetodos).IDF_CODIGO       := 0 
    else
      (iMtd as OMetodos).IDF_CODIGO      := StrtoInt(self.IDF_CODIGO.text);
    If self.CLASS_ID.text = '' then
      (iMtd as OMetodos).CLASS_ID         := 0 
    else
      (iMtd as OMetodos).CLASS_ID        := StrtoInt(self.CLASS_ID.text);
    If self.IDF_SEQ.text = '' then
      (iMtd as OMetodos).IDF_SEQ          := 0 
    else
      (iMtd as OMetodos).IDF_SEQ         := StrtoInt(self.IDF_SEQ.text);
   (iMtd as OMetodos).IDF_CAT         := self.IDF_CAT.text;
   (iMtd as OMetodos).IDF_DESIGNACAO  := self.IDF_DESIGNACAO.text;
   (iMtd as OMetodos).IDF_DIRETORIO   := self.IDF_DIRETORIO.text;
   (iMtd as OMetodos).IDF_METBIND     := self.IDF_METBIND.text;
   (iMtd as OMetodos).IDF_METDIRECT   := self.IDF_METDIRECT.text;
   (iMtd as OMetodos).IDF_METTYPE     := self.IDF_METTYPE.text;
   (iMtd as OMetodos).IDF_OBJETIVO    := self.IDF_OBJETIVO.text;
   (iMtd as OMetodos).IDF_RESPONSAVEL := self.IDF_RESPONSAVEL.text;
   (iMtd as OMetodos).IDF_TIPO        := self.IDF_TIPO.text;
   (iMtd as OMetodos).IDF_VERSAO      := self.IDF_VERSAO.text;
   (iMtd as OMetodos).IDF_VERSAO_DATA := Strtodate(self.IDF_VERSAO_DATA.text);
   (iMtd as OMetodos).MET_COMENT      := self.MET_COMENT.text;
   (iMtd as OMetodos).MET_NOME        := self.MET_NOME.text;
   (iMtd as OMetodos).MET_VISIBIL     := self.MET_VISIBIL.text;
   (iMtd as OMetodos).ddmap;
 end;
  
  
  
procedure TFRM_BST_MTD.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_BST_MTD := nil;
   action := cafree;
 end;

  
procedure TFRM_BST_MTD.FormShow(Sender: TObject);
  begin;
   Inherited;
   iMtd := OMetodos.create;
 end;

   
procedure TFRM_BST_MTD.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iMtd.ID > 0 then //gravou novo 
        begin 
          (iMtd as OMetodos).GetProperties; 
          iMtd.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OMetodos).MET_NOME,iObj.PK);
        end;
      end
   else 
        begin 
         lb.Items[lb.ItemIndex] := (iObJ as OMetodos).MET_NOME
        end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_BST_MTD.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.IDF_CAT.text ='' then 
         raise exception.create('Informar o campo Categoria');
    If self.IDF_DESIGNACAO.text ='' then 
         raise exception.create('Informar o campo Designacao');
    If self.IDF_METBIND.text ='' then 
         raise exception.create('Informar o campo Bind');
    If self.IDF_METDIRECT.text ='' then 
         raise exception.create('Informar o campo Direct');
    If self.IDF_METTYPE.text ='' then 
         raise exception.create('Informar o campo Type');
    If self.IDF_OBJETIVO.text ='' then 
         raise exception.create('Informar o campo Objetivo');
    If self.IDF_TIPO.text ='' then 
         raise exception.create('Informar o campo Tipo');
    
    If self.MET_NOME.text ='' then 
         raise exception.create('Informar o campo Nome');
    If self.MET_VISIBIL.text ='' then 
         raise exception.create('Informar o campo Visibilidade');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_BST_MTD.Mostra_Campos : boolean;
 begin
   (iObj as OMetodos).GetProperties;
   self.CLI_ID.text                   := InttoStr((iObj as OMetodos).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OMetodos).PRJ_ID);
   self.IDF_CODIGO.text               := InttoStr((iObj as OMetodos).IDF_CODIGO);
   self.CLASS_ID.text                 := InttoStr((iObj as OMetodos).CLASS_ID);
   self.IDF_SEQ.text                  := InttoStr((iObj as OMetodos).IDF_SEQ);
   self.IDF_CAT.text                  := (iObj as OMetodos).IDF_CAT;
   self.IDF_DESIGNACAO.text           := (iObj as OMetodos).IDF_DESIGNACAO;
   self.IDF_DIRETORIO.text            := (iObj as OMetodos).IDF_DIRETORIO;
   self.IDF_METBIND.text              := (iObj as OMetodos).IDF_METBIND;
   self.IDF_METDIRECT.text            := (iObj as OMetodos).IDF_METDIRECT;
   self.IDF_METTYPE.text              := (iObj as OMetodos).IDF_METTYPE;
   self.IDF_OBJETIVO.text             := (iObj as OMetodos).IDF_OBJETIVO;
   self.IDF_RESPONSAVEL.text          := (iObj as OMetodos).IDF_RESPONSAVEL;
   self.IDF_TIPO.text                 := (iObj as OMetodos).IDF_TIPO;
   self.IDF_VERSAO.text               := (iObj as OMetodos).IDF_VERSAO;
   self.IDF_VERSAO_DATA.text          := DatetoStr((iObj as OMetodos).IDF_VERSAO_DATA);
   self.MET_COMENT.text               := (iObj as OMetodos).MET_COMENT;
   self.MET_NOME.text                 := (iObj as OMetodos).MET_NOME;
   self.MET_VISIBIL.text              := (iObj as OMetodos).MET_VISIBIL;
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_BST_MTD.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_BST_MTD.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
{Evento do Close Up datetimePicker}
procedure TFRM_BST_MTD.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_IDF_VERSAO_DATA' then 
      begin
            IDF_VERSAO_DATA.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;
  
    
{Evento do Elimina}
end.
