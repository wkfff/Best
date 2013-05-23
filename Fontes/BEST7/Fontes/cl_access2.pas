unit cl_access2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, Registry, frm_primar, buttons,
  Provider, BSTDB, OOSEG;

type

TObj = class
  private


   published


   public
      constructor Create ;
end;


TAccess = class(TObj)
   form : TPrimar;
   form3 : TPrimar;
   form1 : TPrimar;
   ed_atu,ed_nova,ed_conf : tedit;

  private
     fClose     : string;
     fUsecase   : string;
     Fcanc: boolean;
    FNOME: string;
    FSENHA: string;
    FIDUSECASE: integer;
    FIDUSUARIO: integer;
    FATUALIZAVEL: TStringLIst;
    FFORMS: TStringList;
    FWACCES: INTEGER;
    FFORMATU: STRING;
    FVALIDO: boolean;
    FID_DIAGRAMA: INTEGER;
    FCLIENTE: integer;
    FCENARIO: integer;
    FMUTE: boolean;
    FJUSTLOGIN: boolean;
    FNOMEANT: string;
    FNIVEIS_ABAIXO: STRING;
    FLING: string;

     procedure setClose(const value : string);
     procedure bt_okClick(Sender: TObject);
     procedure bt_CancClick(Sender: TObject);

     procedure Setcanc(const Value: boolean);
     procedure SetUSECASE(const Value: string);
     procedure formClose(Sender: TObject; var Action: TCloseAction);
     procedure SetNOME(const Value: string);
     procedure SetSENHA(const Value: string);
     procedure bt_SenhaClick(Sender: TObject);
     procedure frm1Close(Sender: TObject; var Action: TCloseAction);
    procedure SetIDUSECASE(const Value: integer);
    procedure SetIDUSUARIO(const Value: integer);
    procedure SetATUALIZAVEL(const Value: TStringLIst);
    procedure SetFORMS(const Value: TStringList);
    procedure SetWACCES(const Value: INTEGER);
    procedure SetFORMATU(const Value: STRING);
    procedure SetVALIDO(const Value: boolean);
    procedure SetID_DIAGRAMA(const Value: INTEGER);
    procedure SetCENARIO(const Value: integer);
    procedure SetCLIENTE(const Value: integer);
    procedure SetMUTE(const Value: boolean);
    procedure SetJUSTLOGIN(const Value: boolean);
    procedure SetNOMEANT(const Value: string);
    procedure SetNIVEIS_ABAIXO(const Value: STRING);
    procedure SetLING(const Value: string);



  published
   property canc : boolean read Fcanc write Setcanc;
   property USECASE : string  read FUSECASE write SetUSECASE;
   property IDUSECASE : integer read FIDUSECASE write SetIDUSECASE;
   property ID_DIAGRAMA : INTEGER read FID_DIAGRAMA write SetID_DIAGRAMA; // código diagrama
   property IDUSUARIO : integer read FIDUSUARIO write SetIDUSUARIO;
   property NOME : string read FNOME write SetNOME;
   property NOMEANT : string read FNOMEANT write SetNOMEANT;
   property SENHA : string read FSENHA write SetSENHA;
   property FORMS : TStringList read FFORMS write SetFORMS; //lista dos forms
   property ATUALIZAVEL : TStringLIst  read FATUALIZAVEL write SetATUALIZAVEL;
   property WACCESS : INTEGER read FWACCES write SetWACCES;
   property FORMATU : STRING read FFORMATU write SetFORMATU; /// FORM AATUAL
   property VALIDO : boolean read FVALIDO write SetVALIDO;
   property CLIENTE : integer read FCLIENTE write SetCLIENTE;
   property CENARIO : integer read FCENARIO write SetCENARIO;
   property MUTE : boolean read FMUTE write SetMUTE;
   property JUSTLOGIN : boolean  read FJUSTLOGIN write SetJUSTLOGIN;//faz o login sem verificar os privilegios;
   property NIVEIS_ABAIXO : STRING read FNIVEIS_ABAIXO write SetNIVEIS_ABAIXO;
   property LING :string read FLING write SetLING;
    { verifica nome e senha inputada usecase indica o form, pDiag> 0 indica o diagrama}
   function  Check_Access(pNome,pSenha : string;pUsecase,pDiag : integer) : boolean;

    { mostra a tela de input da nova senha}
   procedure ItClick(Sender: TObject);

    { atualizacao senha : ok}
   procedure ConfClick(Sender: TObject);
  public
    constructor Create;
     { mostra  atela de imput do nome e da senha}
  function Exec(pusecase : string) : boolean;

  function VerificaPrivilegio(pUsecase,pDiag,pUsuario : integer) : integer;
  {retorna o id do form}
  function GetUseCase(puc,pLIng : string): integer;
end;



var
 gb               : TgroupBox;
 Edit1,Edit2      : Tedit;
 label1,label2    : Tlabel ;
 b1,b2 ,b3           : TSpeedButton;
 wim : TImage;
 acc : Taccess;

implementation

uses bst_images, bst_main;


//uses sat_dm;

function TAccess.exec(pusecase : string) : boolean;
begin
  canc         := false;
  usecase     := pusecase;

  form.caption := mens163;
  form.Width   := 270;//
  form.Height  := 200;//
  form.Color   := $00FFFEFD;
  {wim          := tImage.Create(form);
  frm_images   := Tfrm_images.Create(form);
  frm_images.ProgramIcon.Picture.SaveToFile(getcurrentdir+'\aaa');
  wim.Picture.LoadFromFile(getcurrentdir+'\aaa');
  wim.Align    := altop;
  frm_images.Close;    }
  gb           := TgroupBox.create(form)  ;
  With gb do
  begin
   align := alClient;
   {top := 150; left := 0;
   width := form.Width;
   height := 250;  }
   caption := defa26;
   parent := form;

   edit1 := Tedit.create(owner) ;  //nome
   With edit1 do
   begin
     text := '';
     parent := gb;
     left := 85;
     top  := 28;
   end;

   edit2 := Tedit.create(owner) ;   //senha
   With edit2 do
   begin
     text := '';
     parent := gb;
     left := 85;
     top  := 60;
     passwordchar := '*';
   end;

   label1 := Tlabel.create(owner) ;
   With label1 do
   begin
     caption := def10005 ;
     parent := gb;
     left := 16;
     top  := 28;
   end;
    label2 := Tlabel.create(owner) ;
   With label2 do
   begin
     caption := defs23;
     parent := gb;
     left := 16;
     top  := 60;
   end;

  b1 := TSpeedButton.create(owner) ;
   With b1 do
   begin
     caption := 'OK';
     parent := gb;
     left := 60;
     top  := 96;
     Width := 61;
     flat := true;
     b1.OnClick := bt_okClick;
   end;
   b2 := TSpeedButton.create(owner) ;
   With b2 do
   begin
     caption := defc32;
     parent := gb;
     left := 128;
     top  := 96;
     Width := 61;
     flat := true;
     b2.OnClick := bt_CancClick;
   end;

   b3 := TSpeedButton.create(owner) ;  // alteraçào senha
   With b3 do
   begin
     caption := defa27;
     parent := gb;
     left := 5;
     top  := 130;
     Width := 120;
     flat := true;
    b3.OnClick := bt_SenhaClick;
   end;

  end;

  form.showModal;
end;

procedure Taccess.bt_okClick(Sender: TObject);     // confirma nome e password
var
i : integer;
begin
 //NOMEANT := NOME;
 
 NOME    := uppercase(edit1.Text);
 If nomeant = '' then
  NOMEANT := NOME;
 SENHA   := edit2.Text;
 USECASE := uppercase(fusecase);
 IDUSECASE := GetUseCase(USECASE,LING);

 If not justlogin then
   Begin
     If check_access(NOME,SENHA,IDUSECASE,ID_DIAGRAMA) then
        valido := true
    else
     valido := false;
   end
 else
   valido := true;  
  

 form.close;
end;

function Taccess.GetUseCase(puc,pLIng : string): integer;     // confirma nome e password

begin
 with oUseCase.create do
   Begin
    IDUSECASE := CheckUseCase(pUc,LING);
    GetProperties;
    formatu := US_DESCRICAO;
    free;
   end;
   result := IDUSECASE;
end;



procedure Taccess.bt_SenhaClick(Sender: TObject);     // alterar senha
begin
  If edit1.Text = '' then // nome nào preenchido then
    showmessage(mens164)
  else
   begin
     NOME := EDIT1.Text;
     ItClick(self);
   end;
end;


function Taccess.Check_Access(pNome,pSenha : string;pUsecase,pDiag : integer) : boolean;
var
i : integer;
begin
   result := false;
   try
   with OPessoa.create do     // verifica a senha intoduzida.....
    begin
      begin
       If CheckAccess(pNome,psenha) then   //...se senha ok..
         begin
          GetProperties;
          IDUSUARIO := ID_USUARIO;
          If Justlogin then
             Begin
                result := true;
               exit;
             end;
            
          If (pNome = 'SUPERVISOR') or (USECASE = 'FRM_MAIN') then   // ..`verifica se é supervisor(acesso a todos usecases}
              begin
                waccess := 2;
                result := true;
              end
            else
             begin
                If  (usecase = 'FRM_USUARIO') OR (usecase = 'FRM_PRIVILEGIO') THEN
                  WACCESS := -1
                else
                   Begin
                    WACCESS     := VerificaPrivilegio(pUseCase,pDiag,IDUSUARIO) ;

                   end;
                  
                If WACCESS = -1 then
                  Begin
                    If not mute then
                      Showmessage(NOME+mens165) ;
                  end                     
                else
                  result := true;
             end;
         end
       else
           Begin
            If not mute then
              ShowMessage(mens166);
           end;
          
       end;
    free;
    end;
    finally

    end;
end;

function Taccess.VerificaPrivilegio(pUsecase,pDiag,pUsuario : integer) : integer;

begin
   result := 0;
   try
     with oPrivilegio.create do
      Begin
         RESULT        := CheckPrivilegio(pUseCase,pDiag,pUsuario,cliente,cenario,self.ling);
         GETPROPERTIES;
         self.NIVEIS_ABAIXO := NIVEIS_ABAIXO;
         free;
      end;
    finally

    end;
end;



constructor TAccess.Create;

begin
  Inherited Create ;
  form         := TPrimar.create(form);
  form.BorderIcons := [];
  NOME   := '';
  SENHA  := '';
  USECASE:= '';
  FORMS       := TStringList.Create;
  ATUALIZAVEL := TStringList.Create;

  form.OnClose := formClose;
  end;


procedure TAccess.setClose(const value : string);
 begin
   fClose := value;
 end;

procedure Taccess.ItClick(Sender: TObject); // alteracao senha
var
  //form1 : TFRm_std;
  label1,label2,Label3 : Tlabel;
  b1 : TSpeedButton;
begin
  NOME := uppercase(edit1.Text);
  SENHA:= edit2.Text;
  USECASE := uppercase(fusecase);

  form1 := TPrimar.create(form1);
  form1.OnClose := frm1Close;
  form1.caption := defs23;
  form1.Width  := 244;
  form1.Height := 170;

  //atual
  ed_atu := Tedit.create(form1) ;
   With ed_atu do
   begin
     text := '';
     parent := form1;
     form1.insertControl(ed_atu);
     left := 68;
     top  := 18;
     passwordchar := '*';
   end;

   label1 := Tlabel.create(form1) ;
   With label1 do
   begin
     caption := defs24;
     parent := form1;
     left := 5;
     top  := 18;
   end;

 //Nova
   ed_nova := Tedit.create(form1) ;
      With ed_nova do
       begin
         text := '';
         parent := form1;
         form1.insertControl(ed_nova);
         left := 68;
         top  := 50;
         passwordchar := '*';
       end;
       label2 := Tlabel.create(form1) ;
         With label2 do
         begin
           caption := defn7;
           parent := form1;
           left := 5;
           top  := 50;
         end;

  //Nova
  ed_conf := Tedit.create(form1) ;
       With ed_conf do
       begin
         text := '';
         parent := form1;
         form1.insertControl(ed_conf);
         left := 68;
         top  := 82;
         passwordchar := '*';
       end;
        label3 := Tlabel.create(form1) ;
       With label3 do
       begin
         caption := defc36;
         parent := form1;
         left := 5;
         top  := 82;
       end;



  b1 := TSpeedButton.create(form1) ;
   With b1 do
   begin
     caption := 'OK';
     parent := form1;
     left := 100;
     top  := 110;
     Width := 50;
     b1.OnClick := ConfClick;
   end;
  form1.showModal;
end;



procedure TAccess.frm1Close(Sender: TObject; var Action: TCloseAction);
begin
try
 begin
       //form1 := nil;
  // action := cafree;
 end;
except
 begin
   raise;
 end;
end;
end;


procedure TAccess.ConfClick(Sender: TObject);
begin
   try
     If ed_atu.text = '' then
         raise exception.create(mens167);
      If ed_nova.text = '' then
         raise exception.create(mens168);
      If ed_conf.text = '' then
         raise exception.create(mens169);
      If Ed_nova.text <> Ed_conf.Text then
         raise exception.create(mens170);
      with oPessoa.create do
        Begin
          If not CheckAccess(NOME,ED_ATU.TEXT) then
             showmessage(mens171)
          else
            Begin
              GetProperties;
              If not AtuSenha(ID_PESSOA,ED_NOVA.TEXT) then
                Raise exception.create(mens171)
              else
                showmessage(mens173);
            end;
        free;
        end;
finally
      form1.close;

   end;

end;


procedure TAccess.bt_CancClick(Sender: TObject);
begin
  canc := true;
  form.Close;
end;

procedure TAccess.Setcanc(const Value: boolean);
begin
  Fcanc := Value;
end;

procedure TAccess.SetUSECASE(const Value: string);
begin
  FUSECASE := Value;
end;

procedure TAccess.formClose(Sender: TObject; var Action: TCloseAction);
begin
 //action := cafree;
 //form  := nil;
end;

procedure TAccess.SetNOME(const Value: string);
begin
  FNOME := Value;
end;

procedure TAccess.SetSENHA(const Value: string);
begin
  FSENHA := Value;
end;








{ TObj }

constructor TObj.Create;
begin
   inherited; 
   

end;




procedure TAccess.SetIDUSECASE(const Value: integer);
begin
  FIDUSECASE := Value;
end;

procedure TAccess.SetIDUSUARIO(const Value: integer);
begin
  FIDUSUARIO := Value;
end;

procedure TAccess.SetATUALIZAVEL(const Value: TStringLIst);
begin
  FATUALIZAVEL := Value;
end;

procedure TAccess.SetFORMS(const Value: TStringList);
begin
  FFORMS := Value;
end;

procedure TAccess.SetWACCES(const Value: INTEGER);
begin
  FWACCES := Value;
end;

procedure TAccess.SetFORMATU(const Value: STRING);
begin
  FFORMATU := Value;
end;

procedure TAccess.SetVALIDO(const Value: boolean);
begin
  FVALIDO := Value;
end;

procedure TAccess.SetID_DIAGRAMA(const Value: INTEGER);
begin
  FID_DIAGRAMA := Value;
end;

procedure TAccess.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

procedure TAccess.SetCLIENTE(const Value: integer);
begin
  FCLIENTE := Value;
end;

procedure TAccess.SetMUTE(const Value: boolean);
begin
  FMUTE := Value;
end;

procedure TAccess.SetJUSTLOGIN(const Value: boolean);
begin
  FJUSTLOGIN := Value;
end;

procedure TAccess.SetNOMEANT(const Value: string);
begin
  FNOMEANT := Value;
end;

procedure TAccess.SetNIVEIS_ABAIXO(const Value: STRING);
begin
  FNIVEIS_ABAIXO := Value;
end;

procedure TAccess.SetLING(const Value: string);
begin
  FLING := Value;
end;

end.
