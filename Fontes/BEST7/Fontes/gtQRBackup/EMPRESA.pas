unit EMPRESA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, CAD_STD, StdCtrls, ComCtrls, Menus, Grids, DBGrids,
  Buttons, ExtCtrls,pd_tier;

type
  TFRM_EMPRESA = class(TCAD_STD)
     l_SITE                              : Tlabel;
     SITE                                : Tedit;
     l_TIPO                              : Tlabel;
     TIPO                                : Tedit;
     l_DATA                              : Tlabel;
     DATA                                : Tedit;
     d_DATA                              : TDateTimePicker;
     l_COMMENT                           : Tlabel;
     COMMENT                             : TMemo;
     l_ATIV                              : Tlabel;
     ATIV                                : Tedit;
     l_E_MAIL                            : Tlabel;
     E_MAIL                              : Tedit;
     l_FAX                               : Tlabel;
     FAX                                 : Tedit;
     l_TELEF1                            : Tlabel;
     TELEF1                              : Tedit;
     TELEF                               : Tedit;
     l_PAIS                              : Tlabel;
     PAIS                                : Tedit;
     l_CEP                               : Tlabel;
     CEP                                 : Tedit;
     l_CIDAD                             : Tlabel;
     CIDAD                               : Tedit;
     l_ESTADO                            : Tlabel;
     ESTADO                              : Tedit;
     l_ENDER                             : Tlabel;
     ENDER                               : Tedit;
     l_INSCR                             : Tlabel;
     INSCR                               : Tedit;
     l_CGC                               : Tlabel;
     CGC                                 : Tedit;
    EMPRESA: TEdit;
    FANTASIA: TEdit;

  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure DBGrid1CellClick(Column: TColumn);
  procedure DateClose(sender : Tobject);
  function Limpa_Campos : boolean;
  Procedure spb_delClick(sender : TObject);
  function Mostra_Campos : boolean;
  function consiste : boolean;
  procedure sp2click(Sender: TObject);
  procedure FormCreate (Sender : Tobject);
  procedure SpeedButton1Click(Sender: TObject);
    procedure lbClick(Sender: TObject);

  private
    FiObj: oEmpresa;
    procedure SetiObj(const Value: oEmpresa);
    { popula os properties do Objeto de negocio}
    procedure ooMap;
    procedure Mostra_Objeto(pNome: string);

    { Private declarations }
  public
    { Public declarations }
  Published
     property iObj : oEmpresa read FiObj write SetiObj;
  end;

var
  FRM_EMPRESA: TFRM_EMPRESA;
  
implementation

{$R *.dfm}

procedure TFRM_EMPRESA.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : integer;
begin
  for i := 0 to lb.Items.Count -1 do   // destroi objetos do ítem
   begin
     If  (lb.Items.Objects[i]) <> nil then
     (lb.Items.Objects[i]).Free;
   end;
  FRM_EMPRESA := nil;
  action := cafree;
end;

procedure TFRM_EMPRESA.FormCreate(Sender: TObject);
  begin;
   inherited;
    iObj := oEmpresa.create;
    iObj.GetAll;
    lb.items := iObj.Lista;
    lTot.Caption := 'Total : '+inttostr(lb.Items.count);
  end;

{ popula os properties do Objeto de negocio}
procedure TFRM_EMPRESA.ooMap;
begin
   iObj.pFANTASIA                            := self.FANTASIA.text;
   iObj.pEMPRESA                             := self.EMPRESA.text;
   iObj.pCGC                                 := self.CGC.text;
   iObj.pINSCR                               := self.INSCR.text;
   iObj.pENDER                               := self.ENDER.text;
   iObj.pESTADO                              := self.ESTADO.text;
   iObj.pCIDAD                               := self.CIDAD.text;
   iObj.pCEP                                 := self.CEP.text;
   iObj.pPAIS                                := self.PAIS.text;
   iObj.pTELEF                               := self.TELEF.text;
   iObj.pTELEF1                              := self.TELEF1.text;
   iObj.pFAX                                 := self.FAX.text;
   iObj.pE_MAIL                              := self.E_MAIL.text;
   iObj.pATIV                                := self.ATIV.text;
   iObj.pCOMMENT                             := self.COMMENT.text;
   If self.DATA.text <> '' then
      iObj. pDATA                               := strtodate(self.DATA.text);
   iObj. pTIPO                               := self.TIPO.text;
   iObj. pSITE                               := self.SITE.text;

   iObj.ddmap;   
end;


{Evento do Botão Confirma master}
procedure TFRM_EMPRESA.sp2click(Sender: TObject);
 Begin
  If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   ooMap;
  Iobj.save;
  showmessage( iObj.resulta);
  If STATUS = 'I' then
   begin
    lb.Items.Add(self.fantasia.Text);
   end;

  inherited;
 end;

{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização}
function TFRM_EMPRESA.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.EMPRESA.text ='' then 
         raise exception.create('Informar o campo Empresa');
    If self.PAIS.text ='' then
         raise exception.create('Informar o campo Pais');
    If self.ATIV.text ='' then 
         raise exception.create('Informar o campo Atividade');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_EMPRESA.Mostra_Campos : boolean;
 begin
   iObj.GetProperties;

   self.FANTASIA.text                 := iObj.pFANTASIA;
   self.EMPRESA.text                  := iObj.pEMPRESA;
   self.CGC.text                      := iObj.pCGC;
   self.INSCR.text                    := iObj.pINSCR;
 //  self.CARGO.text                    := iObj.pCARGO;
   self.ENDER.text                    := iObj.pENDER;
   self.ESTADO.text                   := iObj.pESTADO;
   self.CIDAD.text                    := iObj.pCIDAD;
   self.CEP.text                      := iObj.pCEP;
 //  self.REGIAO.text                   := iObj.pREGIAO;
   self.PAIS.text                     := iObj.pPAIS;
   self.TELEF.text                    := iObj.pTELEF;
   self.TELEF1.text                   := iObj.pTELEF1;
   self.FAX.text                      := iObj.pFAX;
   self.E_MAIL.text                   := iObj.pE_MAIL;
   self.ATIV.text                     := iObj.pATIV;
   self.COMMENT.text                  := iObj.pCOMMENT;
   self.DATA.text                     := DatetoStr(iObj.pDATA);
   self.TIPO.text                     := iObj.pTIPO;
   self.SITE.text                     := iObj.pSITE;
 end;

  
procedure TFRM_EMPRESA. DBGrid1CellClick(Column: TColumn);
  begin;
   inherited;
   Mostra_campos;
  end;

{ Limpa os Tedits}
function TFRM_EMPRESA.Limpa_campos : boolean;
 begin
   inherited;
     self.FANTASIA.text                  := ' ';
     self.EMPRESA.text                   := ' ';
     self.CGC.text                       := ' ';
     self.INSCR.text                     := ' ';
   //  self.CARGO.text                     := ' ';
     self.ENDER.text                     := ' ';
     self.ESTADO.text                    := ' ';
     self.CIDAD.text                     := ' ';
     self.CEP.text                       := ' ';
   //  self.REGIAO.text                    := ' ';
     self.PAIS.text                      := ' ';
     self.TELEF.text                     := ' ';
     self.TELEF1.text                    := ' ';
     self.FAX.text                       := ' ';
     self.E_MAIL.text                    := ' ';
     self.ATIV.text                      := ' ';
     self.COMMENT.text                   := ' ';
     self.DATA.text                      := ' ';
     self.TIPO.text                      := ' ';
     self.SITE.text                      := ' ';
 end;
  
{Evento do Close Up datetimePicker}
procedure TFRM_EMPRESA.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATA' then
      begin
            DATA.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;

{Evento do Elimina}
procedure TFRM_EMPRESA.spb_delClick(Sender: TObject);
 begin
 If MessageDlg('Confirma a Eliminação ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    iObj.Delete;
    lb.Items.Delete(lb.items.IndexOf(self.FANTASIA.text));    // tira da lista
    Limpa_Campos;
    showmessage( iObj.resulta);
  end;
 end;
  

procedure TFRM_EMPRESA.SetiObj(const Value: oEmpresa);
begin
  FiObj := Value;
end;

procedure TFRM_EMPRESA.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    Mostra_objeto(fantasia.text);

end;

procedure TFRM_EMPRESA.Mostra_Objeto(pNome : string);
begin
  inherited;
    iObj.Load(pNome);
    Mostra_Campos;
    spb_del.Enabled := true;
    sp_Insert.Enabled := true;
end;

procedure TFRM_EMPRESA.lbClick(Sender: TObject);
var
pNome : string;
begin
  inherited;
   Mostra_objeto(iObj.Getitem(lb));
end;

pro.
