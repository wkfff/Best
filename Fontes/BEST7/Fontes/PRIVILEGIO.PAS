unit PRIVILEGIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls,adodb,db_tier,OOSEG,baseTier;

  
type
  TFRM_PRIVILEGIO = class(TCAD_STAND)

     C_ACESSO                              : TComboBox;
     C_NIVEIS_ABAIXO                       : TComboBox;

       ID_PRIV                             : Tedit;
     L_ID_PRIV                           : Tlabel;
     D_DATATU                            : TDateTimePicker;
     DATATU                              : Tedit;
     L_DATATU                            : Tlabel;
     ID_USECASE                          : Tedit;
     L_ID_USECASE                        : Tlabel;
     ID_USUARIO                          : Tedit;
     L_ID_USUARIO                        : Tlabel;
     ACESSO                              : Tedit;
     L_ACESSO                            : Tlabel;
     NIVEIS_ABAIXO                       : Tedit;
     L_NIVEIS_ABAIXO                     : Tlabel;
     PRV_DESCRICAO                       : Tedit;
     L_PRV_DESCRICAO                     : Tlabel;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure CmbClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
     Procedure spb_delClick(sender : TObject);


  private
  
     function  consiste : boolean;
     procedure ooMap;


  public

    
  published
   
     property iObj; 
     function  Mostra_Campos : boolean;
     procedure Mostra_Objeto(pNome : string);

  end;

var
  FRM_PRIVILEGIO: TFRM_PRIVILEGIO;

implementation

{$R *.dfm}



  {Início CmbClose}
procedure TFRM_PRIVILEGIO.CmbClose(sender : TObject);
  begin
   inherited;
        
  If UpperCase(TComboBox(sender as Tobject).name) = 'C_ACESSO' then 
    begin
      ACESSO.text := TComboBox(sender as Tobject).Items[TComboBox(sender as Tobject).ItemIndex];
      exit;
    end;
  If UpperCase(TComboBox(sender as Tobject).name) = 'C_NIVEIS_ABAIXO' then 
    begin
      NIVEIS_ABAIXO.text := TComboBox(sender as Tobject).Items[TComboBox(sender as Tobject).ItemIndex];
      exit;
    end;
  end; 
{Fim CmbClose}

{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_PRIVILEGIO.ooMap;
{Início OOMAP}  
 begin
   If self.ID_PRIV.text ='' then 
    (iObj as OPrivilegio).ID_PRIV  := 0
   else
    (iObj as OPrivilegio).ID_PRIV  := StrtoInt(self.ID_PRIV.text);
   (iObj as OPrivilegio).DATATU                      := Strtodate(self.DATATU.text);
    If self.ID_USECASE.text = '' then
      (iObj as OPrivilegio).ID_USECASE                   := 0 
    else
      (iObj as OPrivilegio).ID_USECASE                  := StrtoInt(self.ID_USECASE.text);
    If self.ID_USUARIO.text = '' then
      (iObj as OPrivilegio).ID_USUARIO                   := 0 
    else
      (iObj as OPrivilegio).ID_USUARIO                  := StrtoInt(self.ID_USUARIO.text);
   (iObj as OPrivilegio).ACESSO                      := self.ACESSO.text;
   (iObj as OPrivilegio).NIVEIS_ABAIXO               := self.NIVEIS_ABAIXO.text;
   (iObj as OPrivilegio).PRV_DESCRICAO               := self.PRV_DESCRICAO.text;
   (iObj as OPrivilegio).ddmap;
 end;
{Fim OOMAP}  
  
procedure TFRM_PRIVILEGIO.FormCreate(Sender: TObject);
var
 wdir,wfile,P1,P2: string;
 wbd : TstringList;
  begin
   inherited;
   wBd := TstringList.create;
   wFile := '\PRIVILEGIO' ;
   wFile := wFile+'.ini' ;
   wdir := ExtractFileDir(Application.ExeName);
   wdir := wdir + wFile;
   If FileExists(wDir) then
     begin
      wbd.Loadfromfile(wDir);
      DBAtu := Tdb.create(TADOConnection);
      P1:= 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
      P2:= ';Persist Security Info=False';
      (Dbatu.DbTipo as TAdoConnection).connectionstring := P1+wbd.text+p2;
      end
     else
      Raise exception.create('Arquivo '+wfile+' não Encontrado no Diretório!)');
   iObj := OPrivilegio.create;
   wbd.free;
 end;


  
procedure TFRM_PRIVILEGIO.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_PRIVILEGIO := nil;
   action := cafree;
 end;

  
procedure TFRM_PRIVILEGIO.FormShow(Sender: TObject);
  begin
   Inherited;
   If lb.Count > 0 then
     begin
       lb.ItemIndex := 0;
       lbClick(nil);
       ActiveControl := lb;
     end;
        c_ACESSO.clear;
        c_ACESSO.items.add('Sem Permissão');
        c_ACESSO.items.add('Somente Leitura');
        c_ACESSO.items.add('Todos');
        c_NIVEIS_ABAIXO.clear;
        c_NIVEIS_ABAIXO.items.add('S');
        c_NIVEIS_ABAIXO.items.add('N');
 end;

   
procedure TFRM_PRIVILEGIO.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OPrivilegio).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OPrivilegio).PRV_DESCRICAO,iObj.PK);
          Mostra_objeto(iObj.Getitem(lb)); 
        end;
      end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_PRIVILEGIO.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.DATATU.text ='' then 
         raise exception.create('Informar o campo Dt. Atualização');
    If self.ID_USECASE.text ='' then 
         raise exception.create('Informar o campo Id Use case');
    If self.ID_USUARIO.text ='' then 
         raise exception.create('Informar o campo Id Usuário');
    If self.ACESSO.text ='' then 
         raise exception.create('Informar o campo Direito');
    If self.NIVEIS_ABAIXO.text ='' then 
         raise exception.create('Informar o campo Nivéis Abaixo');
    If self.PRV_DESCRICAO.text ='' then 
         raise exception.create('Informar o campo Privilégio');
 end;


{ Popula os campos Edit com os atributos da TABELA} 
function TFRM_PRIVILEGIO.Mostra_Campos : boolean;
 begin
   (iObj as OPrivilegio).GetProperties;
   self.ID_PRIV.text                  := InttoStr((iObj as OPrivilegio).ID_PRIV);
   self.DATATU.text                   := DatetoStr((iObj as OPrivilegio).DATATU);
   self.ID_USECASE.text               := InttoStr((iObj as OPrivilegio).ID_USECASE);
   self.ID_USUARIO.text               := InttoStr((iObj as OPrivilegio).ID_USUARIO);
   self.ACESSO.text                   := (iObj as OPrivilegio).ACESSO;
   self.NIVEIS_ABAIXO.text            := (iObj as OPrivilegio).NIVEIS_ABAIXO;
   self.PRV_DESCRICAO.text            := (iObj as OPrivilegio).PRV_DESCRICAO;
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_PRIVILEGIO.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_PRIVILEGIO.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
  
procedure TFRM_PRIVILEGIO.DateClose(sender : TObject);
  begin;
   inherited;
   If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATATU' then 
    begin
          DATATU.text := DateToStr(TDatetimePicker(sender as Tobject).date);
          exit;
    end;
  end; 


    
{Evento do Elimina}
procedure TFRM_PRIVILEGIO.spb_delClick(Sender: TObject);
  begin
    inherited;
  end;
  

end.
