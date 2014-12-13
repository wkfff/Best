unit BST_PROP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,OO_BEST, CAD_STD, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls,DB_TIER,ADODB,
BSTDB, ActnList, ImgList, ToolWin;

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
     L_IDF_VERSAO                        : Tlabel;
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
     PROP_VISIBIL                        : Tedit;
    rg_vis: TRadioGroup;
    rd_tipo: TRadioGroup;
    chk_lista: TCheckBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    IDF_VERSAO_DATA: TEdit;
    d_IDF_VERSAO_DATA: TDateTimePicker;
    IDF_VERSAO: TEdit;
    Label2: TLabel;
    Label3: TLabel;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure chk_listaClick(Sender: TObject);
    procedure rg_visClick(Sender: TObject);
    procedure rd_tipoClick(Sender: TObject);


  { Private declarations }
  private
    FCLASSE: INTEGER;
    FCLIENTE: INTEGER;
    FCENARIO: INTEGER;
    FiDom: oDominios;
    FiTipos: oDominios;
     procedure Mostra_Objeto(pNome : string);
     function  consiste : boolean;
     procedure ooMap;
    procedure SetCENARIO(const Value: INTEGER);
    procedure SetCLASSE(const Value: INTEGER);
    procedure SetCLIENTE(const Value: INTEGER);
    procedure SetiDom(const Value: oDominios);
    procedure SetiTipos(const Value: oDominios);

  
   { Public declarations }
  public

    { Published declarations }
  published
     property iObj;
     property iDom : oDominios read FiDom write SetiDom;
     property iTipos : oDominios read FiTipos write SetiTipos;
     property CLIENTE : INTEGER read FCLIENTE write SetCLIENTE;
     property CENARIO : INTEGER read FCENARIO write SetCENARIO;
     property CLASSE : INTEGER read FCLASSE write SetCLASSE;
     
     function  Mostra_Campos : boolean;

   
  end;

var
  FRM_PROP: TFRM_PROP;

implementation

uses bst_main, bst_cs;

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
   (iObj as OPrperty).IDF_TIPO_ATIVIDADE:= self.IDF_TIPO_ATIVIDADE.text;
   (iObj as OPrperty).IDF_VERSAO      := self.IDF_VERSAO.text;
   If self.IDF_VERSAO_DATA.text <> '' then
     (iObj as OPrperty).IDF_VERSAO_DATA := Strtodate(self.IDF_VERSAO_DATA.text)
   else
     (iObj as OPrperty).IDF_VERSAO_DATA := 0;
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
   DBAtu := Tdb.create(TADOConnection);
  (Dbatu.DbTipo as TAdoConnection).connectionstring :=  bdx.connectionstring;
   iObj := OPrperty.create;
   iDom := oDominios.create;
 end;



procedure TFRM_PROP.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_PROP := nil;
   action := cafree;
 end;

  
procedure TFRM_PROP.FormShow(Sender: TObject);
  begin;
   
  (iObj AS oprperty).CLI_ID := Cliente;
  (iObj AS oprperty).PRJ_ID := cenario;
  (iObj AS oprperty).CLASS_ID := Classe;
   (iObj AS oprperty).ddMap;
   Inherited;
   iDom.DI_TIPO := 'PRP';
   iDom.ddMap;
   iDom.GetAll;
   rg_vis.Items := iDom.Lista;

   iDom.DI_TIPO := 'FMT';
   iDom.ddMap;
   iDom.GetAll;
   rd_tipo.items := iDom.Lista;
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
 //   If self.IDF_CAT.text ='' then
 //        raise exception.create('Informar o campo Categoria');
    If self.IDF_DESIGNACAO.text ='' then
         raise exception.create('Informar o campo Designacao');
    If self.PROP_TIPO.text ='' then
         raise exception.create('Informar o campo Tipo');
    If self.PROP_VISIBIL.text ='' then 
         raise exception.create('Informar o campo Visibilidade');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_PROP.Mostra_Campos : boolean;
var
i : integer;
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
   If (iObj as OPrperty).IDF_VERSAO_DATA > 0 then
     self.IDF_VERSAO_DATA.text          := DatetoStr((iObj as OPrperty).IDF_VERSAO_DATA);
   self.IDF_VISIBLE.text              := (iObj as OPrperty).IDF_VISIBLE;
   self.IDG_ID.text                   := InttoStr((iObj as OPrperty).IDG_ID);
   self.LCK.text                      := (iObj as OPrperty).LCK;
   self.PROP_DEFAULT.text             := (iObj as OPrperty).PROP_DEFAULT;
   self.PROP_DOMINIO.text             := (iObj as OPrperty).PROP_DOMINIO;
   self.PROP_TIPO.text                := (iObj as OPrperty).PROP_TIPO;
   for i := 0 to rd_tipo.Items.Count - 1 do
     Begin
      If self.PROP_TIPO.text = rd_tipo.Items[i] then
        rd_tipo.ItemIndex := i;   
     end;

   self.PROP_VISIBIL.text             := (iObj as OPrperty).PROP_VISIBIL;
   rd_tipo.ItemIndex                  := rd_tipo.Items.IndexOf(uppercase(self.prop_tipo.text)) ;
   rg_vis.ItemIndex                   := rg_vis.Items.IndexOf(uppercase(self.prop_visibil.text)) ;
   If idf_lista.text = '1' then
      chk_lista.Checked := true
   else
      chk_lista.Checked := false;
 end;

{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_PROP.Mostra_Objeto(pNome : string);
 begin
   self.CLI_ID.text   := inttostr(CLIENTE);
   self.PRJ_ID.text   := inttostr(CENARIO);
   self.CLASS_ID.text := inttostr(CLASSE);

   (iObj as oPrperty).ddMap;
   iObj.Load(pNome);
   Mostra_Campos;
   //spb_del.Enabled := true;
   //sp_Insert.Enabled := true;
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
procedure TFRM_PROP.SetCENARIO(const Value: INTEGER);
begin
  FCENARIO := Value;
end;

procedure TFRM_PROP.SetCLASSE(const Value: INTEGER);
begin
  FCLASSE := Value;
end;

procedure TFRM_PROP.SetCLIENTE(const Value: INTEGER);
begin
  FCLIENTE := Value;
end;

procedure TFRM_PROP.SetiDom(const Value: oDominios);
begin
  FiDom := Value;
end;

procedure TFRM_PROP.SetiTipos(const Value: oDominios);
begin
  FiTipos := Value;
end;

procedure TFRM_PROP.sp_insertClick(Sender: TObject);
begin
  inherited;
   self.CLI_ID.text   := inttostr(CLIENTE);
   self.PRJ_ID.text   := inttostr(CENARIO);
   self.CLASS_ID.text := inttostr(CLASSE);
   self.IDF_TIPO_ATIVIDADE.Text := 'PY';
end;

procedure TFRM_PROP.chk_listaClick(Sender: TObject);
begin
  inherited;
  If chk_lista.Checked then
    self.IDF_LISTA.text := '1'
  else
    self.IDF_LISTA.text := '0';
end;

procedure TFRM_PROP.rg_visClick(Sender: TObject);
begin
  inherited;
  self.PROP_VISIBIL.Text := rg_vis.Items[rg_vis.ItemIndex];
  
end;

procedure TFRM_PROP.rd_tipoClick(Sender: TObject);
begin
  inherited;
  self.PROP_TIPO.Text    := rd_tipo.Items[rd_tipo.ItemIndex];
end;

end.
