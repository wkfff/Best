unit BST_PERS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls,adodb,db_tier,OOSEG,baseTier,
  Grids, Aligrid,bst_basefrm, ImgList, ToolWin, ActnList;

  
type
  TFRM_PERS = class(TCAD_STAND)


       ID_PESSOA                           : Tedit;
     D_DATATU                            : TDateTimePicker;
     DATATU                              : Tedit;
     L_DATATU                            : Tlabel;
     ID_USUARIO                          : Tedit;
     PES_NOME                            : Tedit;
     L_PES_NOME                          : Tlabel;
     PES_SENHA                           : Tedit;
     L_PES_SENHA                         : Tlabel;
    cmb_pessoa: TComboBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Adicionar: TAction;
    Desfazer: TAction;
    Salvar: TAction;
    Excluir: TAction;
    Imprimir: TAction;
    Sair: TAction;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure cmb_pessoaClick(Sender: TObject);
    procedure spb_delClick(Sender: TObject);


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
  FRM_PERS: TFRM_PERS;

implementation

uses bst_main;

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_PERS.ooMap;
{Início OOMAP}  
 begin
   If self.ID_PESSOA.text ='' then 
    (iObj as OPessoa).ID_PESSOA  := 0
   else
    (iObj as OPessoa).ID_PESSOA  := StrtoInt(self.ID_PESSOA.text);
   (iObj as OPessoa).DATATU                          := Date;
    If self.ID_USUARIO.text = '' then
      (iObj as OPessoa).ID_USUARIO                       := 0 
    else
      (iObj as OPessoa).ID_USUARIO                      := StrtoInt(self.ID_USUARIO.text);
   (iObj as OPessoa).PES_NOME                        := self.PES_NOME.text;
   (iObj as OPessoa).PES_SENHA                       := encripta(self.PES_SENHA.text);
   (iObj as OPESSOA).ID_USUARIO := Key_master;

   (iObj as OPessoa).ddmap;
 end;
{Fim OOMAP}  
  
procedure TFRM_PERS.FormCreate(Sender: TObject);
var
 wdir,wfile,P1,P2: string;
 wbd : TstringList;
  begin
   inherited;
   iObj := OPessoa.create;
 end;              
  
procedure TFRM_PERS.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
   FRM_PERS := nil;
   action := cafree;
 end;

  
procedure TFRM_PERS.FormShow(Sender: TObject);
  begin
   Inherited;

   If lb.Count > 0 then
     begin
       lb.ItemIndex := 0;
       lbClick(nil);
       ActiveControl := lb;
     end;

  // cmb_pessoa.Items := iObj.Lista;
 end;

   
procedure TFRM_PERS.sp2click(Sender: TObject);
  Begin
   If not Consiste then
     raise exception.create(Mens110);
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OPessoa).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject(Inttostr((iObJ as OPessoa).ID_PESSOA),iObj.PK);
          Mostra_objeto(iObj.Getitem(lb)); 
        end;
      end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_PERS.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.PES_NOME.text ='' then
         raise exception.create(mens159);
    If (iObj as oPessoa).CheckNOme(self.pes_nome.text) then
      Begin
       If Status = 'I' then
          raise exception.create(mens161)
       else
       If (iObj as oPessoa).ID_PESSOA = strtoint(self.ID_PESSOA.Text) then
          raise exception.create(mens161)
          
      end;  
        

    If uppercase(self.PES_NOME.text) ='SUPERVISOR' then
         raise exception.create(mens161);
    If self.PES_SENHA.text ='' then 
         raise exception.create(mens162);
    If Key_master = 0 then
      raise exception.create(mens160);
 end;


{ Popula os campos Edit com os atributos da TABELA} 
function TFRM_PERS.Mostra_Campos : boolean;
 begin
   (iObj as OPessoa).GetProperties;
   self.ID_PESSOA.text                := InttoStr((iObj as OPessoa).ID_PESSOA);
   self.DATATU.text                   := DatetoStr((iObj as OPessoa).DATATU);
   self.ID_USUARIO.text               := InttoStr((iObj as OPessoa).ID_USUARIO);
   self.PES_NOME.text                 := (iObj as OPessoa).PES_NOME;
   self.PES_SENHA.text                := encripta((iObj as OPessoa).PES_SENHA);
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_PERS.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   //spb_del.Enabled := true;
   //sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_PERS.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
  
procedure TFRM_PERS.DateClose(sender : TObject);
  begin;
   inherited;
   If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATATU' then 
    begin
          DATATU.text := DateToStr(TDatetimePicker(sender as Tobject).date);
          exit;
    end;
  end;  
    
{Evento do Elimina}
procedure TFRM_PERS.sp_insertClick(Sender: TObject);
begin
  inherited;
  activeControl := pes_nome;
end;

procedure TFRM_PERS.cmb_pessoaClick(Sender: TObject);
var
w : integer;
begin
  inherited;
   w := Tpk(cmb_pessoa.Items.Objects[cmb_pessoa.itemIndex]).PK1;
   Mostra_objeto(inttostr(w));
 // PES_NOME.Text := (iObj as oPessoa).PES_NOME;//[cmb_pessoa.itemindex];
 // PES_SENHA
end;

procedure TFRM_PERS.spb_delClick(Sender: TObject);
begin
  inherited;
  //close;
end;

procedure Tfrm_pers.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
  l_pes_nome.caption := def59 ; //pessoa
  l_Pes_senha.caption:= defs23;//senha
  l_datatu.caption := def6220;//data
  caption          := def59;

  //menu
  //sp_insert.Caption:= Def850;//novo
  //spb_del.Caption  := def84;//delete
  //sp2.caption      := def903;//confirmar;
  //sp_insertDet.Caption:= Def850;//novo detalhe
end;
end.
