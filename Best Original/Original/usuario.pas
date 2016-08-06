unit usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls,adodb,db_tier,PERS,OOSEG,baseTier;

  
type
  TFRM_usuario = class(TCAD_STAND)


       ID_USUARIO                          : Tedit;
     L_ID_USUARIO                        : Tlabel;
     D_DATATU                            : TDateTimePicker;
     DATATU                              : Tedit;
     L_DATATU                            : Tlabel;
     US_NOME                             : Tedit;
     L_US_NOME                           : Tlabel;
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
     Procedure Monta_cab ;
     Procedure Mostra_Contatos ;
     Procedure Abre_Det(Sender: TObject); 
     Procedure sp_inserDetClick(Sender: TObject); 
     Procedure grid_contDblClick(Sender: TObject);


  private
     FoContato: OPessoa;
     function  consiste : boolean;
     procedure ooMap;


  
  
      procedure SetoContato(const Value:OPessoa);


  public

    
  published
     property iContatos :OPessoa read FoContato write SetoContato;
     property iObj; 
     function  Mostra_Campos : boolean;
     procedure Mostra_Objeto(pNome : string);


   
  end;
  
{definição dos campos a mostrar no grid (master-detail)}
const
cCampos  : array [0..4] of string = ('DATATU','ID_USUARIO','US_NOME','CLI_ID','PRJ_ID');
cCaption  : array [0..4] of string = ('Dt. Atualização','Id Usuário','Usuário','Id Cliente','Id Cenário');
 {fim definição dos campos a mostrar no grid (master-detail)}



var
  FRM_usuario: TFRM_usuario;

implementation

{$R *.dfm}



  
             {Monta Grid - Master/detail}  
procedure TFRM_usuario.Monta_cab;  
 var    
 i : integer;   
   begin;  
    Inherited;  
    grid_cont.ColCount := length(cCaption); 
    for i := 0 to length(ccaption)-1 do  
     begin  
       grid_cont.Objects[i,0] := TProp.create; 
       grid_cont.Cells[i,0]   := cCaption[i];  
       (grid_cont.Objects[i,0] as TProp).nomecampo := cCampos[i];
     end;  
   end;  
 {fim Monta Grid - Master/detail}


  
     {Mostra Contatos - Master/detail}  
     procedure TFRM_usuario.Mostra_Contatos;
     var      
     i : integer;  
     begin       
       inherited; 
       Limpa_grid(Grid_cont);
       iContatos           :=OPessoa.create; 
       iContatos.ListaGrid := Grid_cont;    
       iContatos.GetContatos(inttostr(key_detail)) ;  
     end;  
     {fim Mostra COntatos - Master/detail}


       {Início click Grid - Master/detail}  
procedure TFRM_usuario.Abre_det;
 var
  wpk : variant;
  i : integer;
  Begin
   Inherited;
   If Frm_pers = nil then     
      Frm_pers := TFrm_pers.create(self);   
   Frm_pers.grid_cont.visible := false; 
   Frm_pers.sp_print.visible := false;  
   Frm_pers.panel1.visible := false;  
   Frm_pers.Type_Form := 1;    //simples = detail 
   Frm_pers.Key_master := self.Key_Detail; 
   If (sender as TObject) is TSpeedButton then  
      Frm_pers.sp_insertClick(nil)  
   else            
      Begin    
        If grid_cont.Objects[0,grid_cont.row] <> nil then   
           Begin    
              wpk := TPK(grid_cont.Objects[0,grid_cont.row]).pk1 ; 
              Frm_pers.Key_detail := wpk; 
              Frm_pers.Mostra_Objeto(wpk); 
           end;     
      end;     
     Frm_pers.showmodal;   
     Mostra_Contatos; 
  end;     
     {fim click Grid - Master/detail}


  procedure TFRM_usuario.sp_inserDetClick(Sender: TObject);
 Begin
   Abre_det(sp_insertDet);
 end;     

  procedure TFRM_usuario.grid_contDblClick(Sender: TObject);
 Begin
   abre_det(grid_cont);
 end;     

  
procedure TFRM_usuario.SetoContato(const Value:OPessoa);
begin  
  FoContato := Value;  
end; 

{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_usuario.ooMap;
{Início OOMAP}  
 begin
   If self.ID_USUARIO.text ='' then 
    (iObj as OUsuario).ID_USUARIO  := 0
   else
    (iObj as OUsuario).ID_USUARIO  := StrtoInt(self.ID_USUARIO.text);
   (iObj as OUsuario).DATATU                         := Strtodate(self.DATATU.text);
   (iObj as OUsuario).US_NOME                        := self.US_NOME.text;
    If self.CLI_ID.text = '' then
      (iObj as OUsuario).CLI_ID                          := 0 
    else
      (iObj as OUsuario).CLI_ID                         := StrtoInt(self.CLI_ID.text);
    If self.PRJ_ID.text = '' then
      (iObj as OUsuario).PRJ_ID                          := 0 
    else
      (iObj as OUsuario).PRJ_ID                         := StrtoInt(self.PRJ_ID.text);
   (iObj as OUsuario).ddmap;
 end;
{Fim OOMAP}  
  
procedure TFRM_usuario.FormCreate(Sender: TObject);
var
 wdir,wfile,P1,P2: string;
 wbd : TstringList;
  begin
   inherited;
   wBd := TstringList.create;
   wFile := '\usuario' ;
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
   iObj := OUsuario.create;
   wbd.free;
     begin
       Monta_cab;
       grid_cont.OnDblClick := grid_contDBLClick ;
       sp_insertDet.OnClick := sp_inserDetClick ;
       height := lb.height + grid_cont.height + 150 ;
     end;
 end;


  
procedure TFRM_usuario.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_usuario := nil;
   action := cafree;
 end;

  
procedure TFRM_usuario.FormShow(Sender: TObject);
  begin
   Inherited;
   If lb.Count > 0 then
     begin
       lb.ItemIndex := 0;
       lbClick(nil);
       ActiveControl := lb;
     end;
 end;

   
procedure TFRM_usuario.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OUsuario).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OUsuario).US_NOME,iObj.PK);
          Mostra_objeto(iObj.Getitem(lb)); 
        end;
      end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_usuario.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.DATATU.text ='' then 
         raise exception.create('Informar o campo Dt. Atualização');
    If self.US_NOME.text ='' then 
         raise exception.create('Informar o campo Usuário');
    If self.CLI_ID.text ='' then 
         raise exception.create('Informar o campo Id Cliente');
    If self.PRJ_ID.text ='' then 
         raise exception.create('Informar o campo Id Cenário');
 end;


{ Popula os campos Edit com os atributos da TABELA} 
function TFRM_usuario.Mostra_Campos : boolean;
 begin
   (iObj as OUsuario).GetProperties;
   self.ID_USUARIO.text               := InttoStr((iObj as OUsuario).ID_USUARIO);
   self.DATATU.text                   := DatetoStr((iObj as OUsuario).DATATU);
   self.US_NOME.text                  := (iObj as OUsuario).US_NOME;
   self.CLI_ID.text                   := InttoStr((iObj as OUsuario).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OUsuario).PRJ_ID);
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_usuario.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_usuario.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
   Mostra_Contatos;
 end;
  
  
procedure TFRM_usuario.DateClose(sender : TObject);
  begin;
   inherited;
   If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATATU' then 
    begin
          DATATU.text := DateToStr(TDatetimePicker(sender as Tobject).date);
          exit;
    end;
  end; 


    
{Evento do Elimina}
procedure TFRM_usuario.spb_delClick(Sender: TObject);
  begin
    inherited;
  end;
  

end.
