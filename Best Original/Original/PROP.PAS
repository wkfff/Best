unit PROP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,OO_BEST, CAD_STD, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls;

type
  TFRM_PROP = class(TCAD_STD)
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
     IDF_DEL                             : Tedit;
     L_IDF_DEL                           : Tlabel;
     IDF_DESIGNACAO                      : Tedit;
     L_IDF_DESIGNACAO                    : Tlabel;
     IDF_DIRETORIO                       : Tedit;
     L_IDF_DIRETORIO                     : Tlabel;
     IDF_LISTA                           : Tedit;
     L_IDF_LISTA                         : Tlabel;
     IDF_OBJETIVO                        : Tedit;
     L_IDF_OBJETIVO                      : Tlabel;
     IDF_RESPONSAVEL                     : Tedit;
     L_IDF_RESPONSAVEL                   : Tlabel;
     IDF_TIPO_ATIVIDADE                  : Tedit;
     L_IDF_TIPO_ATIVIDADE                : Tlabel;
     IDF_VERSAO                          : Tedit;
     L_IDF_VERSAO                        : Tlabel;
     D_IDF_VERSAO_DATA                   : TDateTimePicker;
     IDF_VERSAO_DATA                     : Tedit;
     L_IDF_VERSAO_DATA                   : Tlabel;
     IDF_VISIBLE                         : Tedit;
     L_IDF_VISIBLE                       : Tlabel;
     IDG_ID                              : Tedit;
     L_IDG_ID                            : Tlabel;
     LCK                                 : Tedit;
     L_LCK                               : Tlabel;
     PROP_DEFAULT                        : Tedit;
     L_PROP_DEFAULT                      : Tlabel;
     PROP_DOMINIO                        : Tedit;
     L_PROP_DOMINIO                      : Tlabel;
     PROP_TIPO                           : Tedit;
     L_PROP_TIPO                         : Tlabel;
     PROP_VISIBIL                        : Tedit;
     L_PROP_VISIBIL                      : Tlabel;

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
  FRM_PROP: TFRM_PROP;

implementation

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_PROP.ooMap;
 begin
    If self.CLI_ID.text = '' then
      (iObj as OPrperty).CLI_ID           := 0 
    else
      (iObj as OPrperty).CLI_ID          := StrtoInt(self.CLI_ID.text);
    If self.PRJ_ID.text = '' then
      (iObj as OPrperty).PRJ_ID           := 0 
    else
      (iObj as OPrperty).PRJ_ID          := StrtoInt(self.PRJ_ID.text);
    If self.IDF_CODIGO.text = '' then
      (iObj as OPrperty).IDF_CODIGO       := 0 
    else
      (iObj as OPrperty).IDF_CODIGO      := StrtoInt(self.IDF_CODIGO.text);
    If self.CLASS_ID.text = '' then
      (iObj as OPrperty).CLASS_ID         := 0 
    else
      (iObj as OPrperty).CLASS_ID        := StrtoInt(self.CLASS_ID.text);
    If self.IDF_SEQ.text = '' then
      (iObj as OPrperty).IDF_SEQ          := 0 
    else
      (iObj as OPrperty).IDF_SEQ         := StrtoInt(self.IDF_SEQ.text);
   (iObj as OPrperty).IDF_CAT         := self.IDF_CAT.text;
   (iObj as OPrperty).IDF_DEL         := self.IDF_DEL.text;
   (iObj as OPrperty).IDF_DESIGNACAO  := self.IDF_DESIGNACAO.text;
   (iObj as OPrperty).IDF_DIRETORIO   := self.IDF_DIRETORIO.text;
    If self.IDF_LISTA.text = '' then
      (iObj as OPrperty).IDF_LISTA        := 0 
    else
      (iObj as OPrperty).IDF_LISTA       := StrtoInt(self.IDF_LISTA.text);
   (iObj as OPrperty).IDF_OBJETIVO    := self.IDF_OBJETIVO.text;
   (iObj as OPrperty).IDF_RESPONSAVEL := self.IDF_RESPONSAVEL.text;
   (iObj as OPrperty).IDF_TIPO_ATIVIDA:= self.IDF_TIPO_ATIVIDADE.text;
   (iObj as OPrperty).IDF_VERSAO      := self.IDF_VERSAO.text;
   (iObj as OPrperty).IDF_VERSAO_DATA := Strtodate(self.IDF_VERSAO_DATA.text);
   (iObj as OPrperty).IDF_VISIBLE     := self.IDF_VISIBLE.text;
    If self.IDG_ID.text = '' then
      (iObj as OPrperty).IDG_ID           := 0 
    else
      (iObj as OPrperty).IDG_ID          := StrtoInt(self.IDG_ID.text);
   (iObj as OPrperty).LCK             := self.LCK.text;
   (iObj as OPrperty).PROP_DEFAULT    := self.PROP_DEFAULT.text;
   (iObj as OPrperty).PROP_DOMINIO    := self.PROP_DOMINIO.text;
   (iObj as OPrperty).PROP_TIPO       := self.PROP_TIPO.text;
   (iObj as OPrperty).PROP_VISIBIL    := self.PROP_VISIBIL.text;
   (iObj as OPrperty).ddmap;
 end;
  
  
procedure TFRM_PROP.FormCreate(Sender: TObject);
  begin;
   inherited;
   iObj := OPrperty.create;
 end;


  
procedure TFRM_PROP.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_PROP := nil;
   action := cafree;
 end;

  
procedure TFRM_PROP.FormShow(Sender: TObject);
  begin;
   Inherited;
   iObj := OPrperty.create;
 end;

   
procedure TFRM_PROP.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OPrperty).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OPrperty).IDF_DESIGNACAO,iObj.PK);
        end;
      end
   else 
        begin 
         lb.Items[lb.ItemIndex] := (iObJ as OPrperty).IDF_DESIGNACAO
        end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_PROP.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.IDF_CAT.text ='' then 
         raise exception.create('Informar o campo Categoria');
    If self.IDF_DESIGNACAO.text ='' then 
         raise exception.create('Informar o campo Designacao');
    If self.PROP_TIPO.text ='' then 
         raise exception.create('Informar o campo Tipo');
    If self.PROP_VISIBIL.text ='' then 
         raise exception.create('Informar o campo Visibilidade');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_PROP.Mostra_Campos : boolean;
 begin
   (iObj as OPrperty).GetProperties;
   self.CLI_ID.text                   := InttoStr((iObj as OPrperty).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OPrperty).PRJ_ID);
   self.IDF_CODIGO.text               := InttoStr((iObj as OPrperty).IDF_CODIGO);
   self.CLASS_ID.text                 := InttoStr((iObj as OPrperty).CLASS_ID);
   self.IDF_SEQ.text                  := InttoStr((iObj as OPrperty).IDF_SEQ);
   self.IDF_CAT.text                  := (iObj as OPrperty).IDF_CAT;
   self.IDF_DEL.text                  := (iObj as OPrperty).IDF_DEL;
   self.IDF_DESIGNACAO.text           := (iObj as OPrperty).IDF_DESIGNACAO;
   self.IDF_DIRETORIO.text            := (iObj as OPrperty).IDF_DIRETORIO;
   self.IDF_LISTA.text                := InttoStr((iObj as OPrperty).IDF_LISTA);
   self.IDF_OBJETIVO.text             := (iObj as OPrperty).IDF_OBJETIVO;
   self.IDF_RESPONSAVEL.text          := (iObj as OPrperty).IDF_RESPONSAVEL;
   self.IDF_TIPO_ATIVIDADE.text       := (iObj as OPrperty).IDF_TIPO_ATIVIDADE;
   self.IDF_VERSAO.text               := (iObj as OPrperty).IDF_VERSAO;
   self.IDF_VERSAO_DATA.text          := DatetoStr((iObj as OPrperty).IDF_VERSAO_DATA);
   self.IDF_VISIBLE.text              := (iObj as OPrperty).IDF_VISIBLE;
   self.IDG_ID.text                   := InttoStr((iObj as OPrperty).IDG_ID);
   self.LCK.text                      := (iObj as OPrperty).LCK;
   self.PROP_DEFAULT.text             := (iObj as OPrperty).PROP_DEFAULT;
   self.PROP_DOMINIO.text             := (iObj as OPrperty).PROP_DOMINIO;
   self.PROP_TIPO.text                := (iObj as OPrperty).PROP_TIPO;
   self.PROP_VISIBIL.text             := (iObj as OPrperty).PROP_VISIBIL;
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_PROP.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_PROP.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
{Evento do Close Up datetimePicker}
procedure TFRM_PROP.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_IDF_VERSAO_DATA' then 
      begin
            IDF_VERSAO_DATA.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;
  
    
{Evento do Elimina}
end.
