unit SEGUC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls,adodb,db_tier,OOSEG,baseTier;

  
type
  TFRM_SEGUC = class(TCAD_STAND)


       ID_USECASE                          : Tedit;
     L_ID_USECASE                        : Tlabel;
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

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
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
  FRM_SEGUC: TFRM_SEGUC;

implementation

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_SEGUC.ooMap;
{Início OOMAP}  
 begin
   If self.ID_USECASE.text ='' then 
    (iObj as OUsecase).ID_USECASE  := 0
   else
    (iObj as OUsecase).ID_USECASE  := StrtoInt(self.ID_USECASE.text);
   (iObj as OUsecase).DATATU                         := Strtodate(self.DATATU.text);
   (iObj as OUsecase).UC_NOME                        := self.UC_NOME.text;
   (iObj as OUsecase).US_DESCRICAO                   := self.US_DESCRICAO.text;
    If self.CLI_ID.text = '' then
      (iObj as OUsecase).CLI_ID                          := 0 
    else
      (iObj as OUsecase).CLI_ID                         := StrtoInt(self.CLI_ID.text);
    If self.PRJ_ID.text = '' then
      (iObj as OUsecase).PRJ_ID                          := 0 
    else
      (iObj as OUsecase).PRJ_ID                         := StrtoInt(self.PRJ_ID.text);
   (iObj as OUsecase).ddmap;
 end;
{Fim OOMAP}  
  
procedure TFRM_SEGUC.FormCreate(Sender: TObject);
var
 wdir,wfile,P1,P2: string;
 wbd : TstringList;
  begin
   inherited;
   wBd := TstringList.create;
   wFile := '\SEGUC' ;
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
   iObj := OUsecase.create;
   wbd.free;
 end;


  
procedure TFRM_SEGUC.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_SEGUC := nil;
   action := cafree;
 end;

  
procedure TFRM_SEGUC.FormShow(Sender: TObject);
  begin
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
      end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_SEGUC.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.DATATU.text ='' then 
         raise exception.create('Informar o campo DT. Atualização');
    If self.UC_NOME.text ='' then 
         raise exception.create('Informar o campo Use Case');
    If self.US_DESCRICAO.text ='' then 
         raise exception.create('Informar o campo Descrição');
 end;


{ Popula os campos Edit com os atributos da TABELA} 
function TFRM_SEGUC.Mostra_Campos : boolean;
 begin
   (iObj as OUsecase).GetProperties;
   self.ID_USECASE.text               := InttoStr((iObj as OUsecase).ID_USECASE);
   self.DATATU.text                   := DatetoStr((iObj as OUsecase).DATATU);
   self.UC_NOME.text                  := (iObj as OUsecase).UC_NOME;
   self.US_DESCRICAO.text             := (iObj as OUsecase).US_DESCRICAO;
   self.CLI_ID.text                   := InttoStr((iObj as OUsecase).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OUsecase).PRJ_ID);
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_SEGUC.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
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
procedure TFRM_SEGUC.spb_delClick(Sender: TObject);
  begin
    inherited;
  end;
  

end.
