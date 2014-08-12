unit cls_bd;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, IBDatabase, forms,
  registry, IBCustomDataSet, Provider, ADODB, bst_Configdb, strutils,
  fonctions, db_tier;

type

Tbd = Class(TAdoConnection)
    form : Tfrm_configdb;
  Private
    FwLike: string;
    FTIPOBANCO: INTEGER;
    FALIASBD: STRING;
    FWSALVA: BOOLEAN;
    
    procedure formClose(Sender: TObject; var Action: TCloseAction);
    procedure SetwLike(const Value: string);
    procedure SetTIPOBANCO(const Value: INTEGER);
    procedure SetALIASBD(const Value: STRING);
    procedure SetWSALVA(const Value: BOOLEAN);

  published
    property wLike : string read FwLike write SetwLike;
    property TIPOBANCO : INTEGER read FTIPOBANCO write SetTIPOBANCO; //0 : access
                                  //1 : SQL SERVER
    property ALIASBD : STRING read FALIASBD write SetALIASBD;
    property WSALVA : BOOLEAN read FWSALVA write SetWSALVA;
  public
   Dirbanco : string;
   DirFluxo : string;
   Servidor : string;
   NomeBanco : string;

   Term : boolean;
   constructor Create(pAtu,pSalva,pChoose : boolean); overload;

end;
var
dirb,dirf : string;
implementation

uses bst_main,cls_obj,bstdb, des_main;

procedure TBd.formClose(Sender: TObject; var Action: TCloseAction);
begin
//If wSalva then
 begin
   DirBanco :=  form.edit2.text;
   DirFluxo :=  form.edit1.text;
   servidor :=  form.edit5.text;
   NomeBanco := form.edit6.text;
   //AliasBd   := form.edit4.text;
   AliasBd   := form.cmb_alias.text;
   TIPOBANCO := form.rdg.itemindex;
 end;
 
 form := nil;
 action := caFree;

end;


constructor TBD.Create(pAtu,psalva,pChoose : boolean);
VAR
REG : TREGISTRY;
i : integer;
bdname : string;
begin
 Inherited create(application);
  try
   begin
     begin
       wSalva := psalva;
       Connected := false;
       If pChoose then
         Begin
           If form   = nil then
              form := Tfrm_ConfigDB.create(self);
           If frm_desmain = nil then
              Begin
                  If NOT Checa_Acesso(uppercase('frm_ConfigDB'),frm_main.SEGHABILIATADO,0) then
                    form.tb_configo.TabVisible := false;
              end;


           form.OnClose  := formClose;
           form.PageControl1.ActivePage := form.tb_configo;
         end;
    {    }
       Reg := TRegistry.Create;
       Reg.RootKey := HKEY_CURRENT_USER;

       If Reg.OpenKey('Software',false) then
        Begin
         If not Reg.OpenKey('Best72',false) then
          begin
            If MessageDlg(mens111,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                Reg.OpenKey('Best72',false) ;
             //   form.showmodal;
                Reg.CreateKey('Best72')  ;
                Reg.OpenKey('Best72',false) ;
              end;
          end
      else
           begin
              If pSalva then
               begin
                  DirBanco :=  Reg.readString('dir') ;
                  DirFluxo :=  Reg.readString('DirFluxo') ;
                  Servidor :=  Reg.readString('servidor') ;
                  Nomebanco :=  Reg.readString('Nome_Banco') ;
                  AliasBd   :=  Reg.readString('Alias') ;

                 If pAtu then
                  begin
                  If pChoose then
                    Begin
                        form.edit1.text := DirFluxo;
                        form.edit2.text := Dirbanco;
                        form.edit6.text := Nomebanco;
                        form.edit5.text := Servidor;
                    end;
               {   }

                  If Dirbanco = '' then
                     TIPOBANCO := 1
                  else
                  If servidor = '' then
                     TIPOBANCO := 0;
                  If pChoose then
                    Begin
                      form.rdg.ItemIndex := TIPOBANCO;
                      form.rdgClick(nil);
                      //form.Edit4.text := AliasBd;
                      form.cmb_alias.text := AliasBd;
                      form.PageControl1.ActivePage := form.tb_disp;
                      for i := 0 to form.rg.Items.Count - 1 do  // MARCA O ALIAS COMO DEFAULT NA LISTA
                       Begin
                        //If uppercase(parse_left(form.rg.Items[i],'.')) = uppercase(parse_left(form.edit4.text,'.')) then
                        If uppercase(parse_left(form.rg.Items[i],'.')) = uppercase(parse_left(form.cmb_alias.text,'.')) then
                         form.rg.ItemIndex := i;
                       end;
                    end;

                {    }
                end ;


               end;
            If pChoose then
               form.showmodal;
           end;

           If rightstr(DirFluxo,1) <> '\' then
              dirFluxo := DirFluxo + '\';
           If pSalva then
            begin
              Reg.WriteString('DirFluxo',DirFluxo) ;
              Reg.WriteString('Alias',AliasBd) ;
            end;

           If Dirbanco = '' then
              TIPOBANCO := 1
           else
           If servidor = '' then
             TIPOBANCO := 0;

           If TIPOBANCO = 1 then
           { bancos sql}

            Begin     //sql server
              If SERVIDOR = '' then
               Raise exception.create(mens112);
              If Nomebanco = '' then
               Raise exception.create(mens113);
              If pSalva then
               begin
                  Reg.WriteString('Servidor',servidor) ;
                  Reg.WriteString('dir','') ;
                  Reg.WriteString('Nome_banco',nomebanco) ;
               end;


              provider         := 'SQLOLEDB.1';
             // ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+'BEST'+';Data Source='+SERVIDOR;
             ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+NOMEBANCO+';Data Source='+SERVIDOR;
             // ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+DIRBANCO+';Data Source='+SERVIDOR;
              wLike := '%';
              LoginPrompt      := true;
              CursorLocation   := clUseServer;
              connected        := true;
            end
           else
           If TIPOBANCO = 2 then
           { bancos INFORMIX}

            Begin     //sql server
              If SERVIDOR = '' then
               Raise exception.create(mens112);
              If Nomebanco = '' then
               Raise exception.create(mens113);
              If pSalva then
               begin
                 Reg.WriteString(def99,Servidor) ;
                 Reg.WriteString('dir','') ;
                 Reg.WriteString(def100,Nomebanco) ;
               end;


              provider         := 'SQLOLEDB.1';
              ConnectionString := 'Provider=Ifxoledbc.2;Persist Security Info=False;Data Source='+NOMEBANCO+'@'+SERVIDOR;
              wLike := '%';
              LoginPrompt      := true;
              CursorLocation   := clUseServer;
              connected        := true;
            end

           else   //access
           If TIPOBANCO = 0 then
            Begin
              If DirBanco = '' then
               Raise exception.create('Informar o caminho do Banco de Dados Access!');
              provider         := 'Microsoft.Jet.OLEDB.4.0';
              ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DirBanco+';Persist Security Info=False;Jet OLEDB:Database Password=chichaoua';
              If pSalva then
               begin
                  Reg.WriteString(def99,'') ;
                  Reg.WriteString('dir',DirBanco) ;
               end;

              wLike := '%';
              LoginPrompt      := false;
              CursorLocation   := clUseServer;
              connected        := true;
              DBAtu := Tdb.create(TADOConnection);
             (Dbatu.DbTipo as TAdoConnection).connectionstring :=  connectionstring;
            end;


        end;
     end;

   end;
  except
   begin
     raise;
   end;
  end;
  reg.CloseKey;
  reg.Free;
end;

procedure Tbd.SetwLike(const Value: string);
begin
  FwLike := Value;
end;

procedure Tbd.SetTIPOBANCO(const Value: INTEGER);
begin
  FTIPOBANCO := Value;
end;

procedure Tbd.SetALIASBD(const Value: STRING);
begin
  FALIASBD := Value;
end;

procedure Tbd.SetWSALVA(const Value: BOOLEAN);
begin
  FWSALVA := Value;
end;

end.
