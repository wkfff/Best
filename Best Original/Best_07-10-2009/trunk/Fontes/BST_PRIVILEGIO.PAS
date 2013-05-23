unit BST_PRIVILEGIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,Stdctrls,CAD_STAND, ComCtrls, Menus, Buttons, ExtCtrls,adodb,db_tier,OOSEG,baseTier,
  Grids, Aligrid,bstdb, ActnList, ImgList, ToolWin;

  
type
  TFRM_PRIVILEGIO = class(TCAD_STAND)

       ID_PRIV                             : Tedit;
     D_DATATU                            : TDateTimePicker;
     DATATU                              : Tedit;
     L_DATATU                            : Tlabel;
     ID_USECASE                          : Tedit;
     L_ID_USECASE                        : Tlabel;
     ID_USUARIO                          : Tedit;
     L_ID_USUARIO                        : Tlabel;
     ACESSO                              : Tedit;
     NIVEIS_ABAIXO                       : Tedit;
     PRV_DESCRICAO                       : Tedit;
     L_PRV_DESCRICAO                     : Tlabel;
    RDG_ACESSO: TRadioGroup;
    RDG_NIVEL: TRadioGroup;
    CLI_ID: TEdit;
    PRJ_ID: TEdit;
    IDG_ID: TEdit;
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
     procedure CmbClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
    procedure RDG_ACESSOClick(Sender: TObject);
    procedure RDG_NIVELClick(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);


  private
    FCLASSE: STRING;
  
     function  consiste : boolean;
     procedure ooMap;
     procedure SetCLASSE(const Value: STRING);
     function GeraPriv(pDiag : TDiag_dados) : boolean;
    


  public

    
  published

     property iObj;
     property CLASSE : STRING read FCLASSE write SetCLASSE;
     function  Mostra_Campos : boolean;
     procedure Mostra_Objeto(pNome : string);
     function CriaPrivAbaixo(pCli, pProj, pDiag,pUsu: integer; pClasse: string;
      pCria: boolean): boolean;
     procedure LoadCOnstantObj;override;
  end;

var
  FRM_PRIVILEGIO: TFRM_PRIVILEGIO;

implementation

uses bst_treeAtiv, bst_main;

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
   (iObj as OPrivilegio).DATATU                      := Date;
    If self.ID_USECASE.text = '' then
      (iObj as OPrivilegio).ID_USECASE                   := 0 
    else
      (iObj as OPrivilegio).ID_USECASE                  := StrtoInt(self.ID_USECASE.text);
    If self.ID_USUARIO.text = '' then
      (iObj as OPrivilegio).ID_USUARIO                   := 0 
    else
      (iObj as OPrivilegio).ID_USUARIO                  := StrtoInt(self.ID_USUARIO.text);

    If self.IDG_ID.text = '' then
      (iObj as OPrivilegio).IDG_ID                 := 0
    else
      (iObj as OPrivilegio).IDG_ID                  := StrtoInt(self.IDG_ID.text);

    If self.CLI_ID.TEXT = '' then
      (iObj as OPrivilegio).CLI_ID                   := 0
    else
      (iObj as OPrivilegio).CLI_ID                  := StrtoInt(self.CLI_ID.text);

    If self.PRJ_ID.text = '' then
      (iObj as OPrivilegio).PRJ_ID                   := 0
    else
      (iObj as OPrivilegio).PRJ_ID                  := StrtoInt(self.PRJ_ID.text);

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
   iObj := OPrivilegio.create;
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

   If (ioBj as oPrivilegio).ID_PRIV > 0 then
      Begin
       id_priv.text := inttostr((iObj as oPrivilegio).ID_PRIV);
       Mostra_objeto(id_priv.text) ;
      end;
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
          If frm_treeativ <> nil then
            Begin
               If self.NIVEIS_ABAIXO.text = '1' then
                 Begin
                  CriaPrivAbaixo(strtoint(self.CLI_ID.text),strtoint(self.PRJ_ID.text),
                              strtoint(self.IDG_ID.text),strtoint(self.ID_USUARIO.text),SELF.CLASSE,TRUE);
                end;
         
             end;
        end;
      end;
   //close;
 end;


{ cria/descria privilégios para os níveis abaix}
function TFRM_PRIVILEGIO.CriaPrivAbaixo(pCli,pProj,pDiag,pUsu : integer; pClasse : string;pCria : boolean) : boolean;
var
iDiag : TDIag_dados;
Begin
   iDiag := TDIag_dados.create(self);
   iDiag.Get_Filhos(pCli,pProj,pDiag,pClasse,'' );
   while not iDiag.eof do
     Begin
     If pCria then
       Begin
         with oPrivilegio.Create do
          Begin
            GeraPriv(iDiag);
            CRiaPrivAbaixo(pCli,pProj,iDiag.fieldbyname('IDG_ID').ASINTEGER,pUsu,pClasse,TRUE);
            free;
          end;
        iDiag.next;
       end
     else
        Begin
          with oPrivilegio.Create do
          Begin
            DelDoUsuarioDiag(pUsu,pCli,pProj,iDiag.fieldbyname('IDG_ID').ASINTEGER);
            CRiaPrivAbaixo(pCli,pProj,iDiag.fieldbyname('IDG_ID').ASINTEGER,pusu,pClasse,TRUE);
            free;
          end;
        end;

     end;
   iDiag.Free;
end;

 { grava filho}
function TFRM_PRIVILEGIO.GeraPriv(pDiag : TDiag_dados) : boolean;
  Begin
   frm_privilegio.ID_priv.text := '0';
   frm_privilegio.PRV_DESCRICAO.TEXT := pDiag.fieldbyname('SUB_NOME').Asstring;
   frm_privilegio.IDG_ID.text := pDiag.fieldbyname('IDG_ID').Asstring;
   oomap;
   iObj.save;
  end;


{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização}
function TFRM_PRIVILEGIO.Consiste : boolean;
 begin
   inherited;
   result := true;
  {  If self.ID_USECASE.text ='' then
         raise exception.create('Informar o campo Id Use case');  }
    If self.ID_USUARIO.text ='' then
         raise exception.create('Informar o campo Id Usuário');
    If self.ACESSO.text ='' then
         raise exception.create('Informar o campo Acesso');
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
   If self.ACESSO.text <>''then
      rdg_acesso.ItemIndex               := strtoint(self.ACESSO.text) - 1;
   self.NIVEIS_ABAIXO.text            := (iObj as OPrivilegio).NIVEIS_ABAIXO;
   If self.NIVEIS_ABAIXO.text <> '' then
      rdg_nivel.ItemIndex                := strtoint(self.NIVEIS_ABAIXO.text) - 1;
   self.PRV_DESCRICAO.text            := (iObj as OPrivilegio).PRV_DESCRICAO;
   self.CLI_ID.text                   := InttoStr((iObj as OPrivilegio).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OPrivilegio).PRJ_ID);
   self.IDG_ID.text                   := InttoStr((iObj as OPrivilegio).IDG_ID);
 end;

{ Popula os campos Edit com os atributos da tabela}
procedure TFRM_PRIVILEGIO.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   //spb_del.Enabled := true;
   //sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_PRIVILEGIO.lbClick(Sender: TObject);
 begin
   Inherited;
  // Mostra_objeto(iObj.Getitem(lb));
    id_priv.text := inttostr((iObj as oPrivilegio).ID_PRIV);
    Mostra_objeto(id_priv.text) ;
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
procedure TFRM_PRIVILEGIO.RDG_ACESSOClick(Sender: TObject);
begin
  inherited;
  ACESSO.Text :=  inttostr(rdg_acesso.itemindex+1);
end;

procedure TFRM_PRIVILEGIO.RDG_NIVELClick(Sender: TObject);
begin
  inherited;
  niveis_abaixo.Text := inttostr(rdg_nivel.itemindex+1);
end;




procedure TFRM_PRIVILEGIO.SetCLASSE(const Value: STRING);
begin
  FCLASSE := Value;
end;

procedure TFRM_PRIVILEGIO.spb_delClick(Sender: TObject);
begin
  inherited;
  If self.NIVEIS_ABAIXO.text = '1' then
    Begin
        CriaPrivAbaixo(strtoint(self.CLI_ID.text),strtoint(self.PRJ_ID.text),
                    strtoint(self.IDG_ID.text),strtoint(self.ID_USUARIO.text),SELF.CLASSE,FALSE);
    end;
end;

procedure TFRM_PRIVILEGIO.sp_insertClick(Sender: TObject);
begin
 // inherited;
   //sp2.enabled       := true;
  //spb_del.enabled   := false;
  //sp_insert.enabled := false;
  STATUS            := 'I';
  rdg_acesso.ItemIndex := -1;
  rdg_nivel.ItemIndex  := -1;
  Limpa_grid(Grid_cont);
end;

procedure TFRM_PRIVILEGIO.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
  caption := defp18;
  rdg_acesso.Caption :=  defa26   ;//acesso
  rdg_acesso.Items[0] := defc12   ;//somente leitura
  rdg_acesso.Items[1] :=  DEFa28  ;//acesso total-
  rdg_nivel.Caption   := defn5 ;// Niveis abaixo;
  rdg_nivel.Items[0]  := def935  ;// s
  rdg_nivel.Items[1]  :=  def240 ;// n
  l_datatu.caption := def6220;//data
  l_prv_descricao.caption  := defp18;


   //menu
  //sp_insert.Caption:= Def850;//novo
  //spb_del.Caption  := def84;//delete
  //sp2.caption      := def903;//confirmar;

end;

procedure TFRM_PRIVILEGIO.ToolButton6Click(Sender: TObject);
begin
  inherited;
  //Close;
end;

end.
