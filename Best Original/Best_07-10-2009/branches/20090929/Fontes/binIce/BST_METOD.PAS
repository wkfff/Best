unit BST_METOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,OO_BEST, CAD_STD, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls,
  DBCtrls,BSTDB,DB_TIER,ADODB, ActnList, ImgList, ToolWin;

type
  TFRM_METOD = class(TCAD_STD)
       CLI_ID                              : Tedit;
     PRJ_ID                              : Tedit;
     IDF_CODIGO                          : Tedit;
     CLASS_ID                            : Tedit;
     IDF_SEQ                             : Tedit;
     IDF_CAT                             : Tedit;
     L_IDF_CAT                           : Tlabel;
     IDF_DEL                             : Tedit;
     L_IDF_DEL                           : Tlabel;
     IDF_DESIGNACAO                      : Tedit;
     L_IDF_DESIGNACAO                    : Tlabel;
     IDF_DIRETORIO                       : Tedit;
     IDF_METBIND                         : Tedit;
     IDF_METDIRECT                       : Tedit;
     IDF_METTYPE                         : Tedit;
     IDF_OBJETIVO                        : Tedit;
     L_IDF_OBJETIVO                      : Tlabel;
     IDF_RESPONSAVEL                     : Tedit;
     IDF_TIPO                            : Tedit;
     IDF_TIPO_ATIVIDADE                  : Tedit;
     IDF_VISIBLE                         : Tedit;
     L_IDF_VISIBLE                       : Tlabel;
     IDG_ID                              : Tedit;
     L_IDG_ID                            : Tlabel;
     LCK                                 : Tedit;
     L_LCK                               : Tlabel;
     MET_COMENT                          : Tedit;
     L_MET_COMENT                        : Tlabel;
     MET_NOME                            : Tedit;
     L_MET_NOME                          : Tlabel;
     MET_VISIBIL                         : Tedit;
    rd_bin: TRadioGroup;
    rd_dir: TRadioGroup;
    rd_mtipo: TRadioGroup;
    rd_mvis: TRadioGroup;
    GroupBox2: TGroupBox;
    IDF_VERSAO: TEdit;
    IDF_VERSAO_DATA: TEdit;
    d_IDF_VERSAO_DATA: TDateTimePicker;
    rd_timm: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

       procedure FormCreate (sender : TObject);
     procedure FormClose (Sender: TObject; var Action: TCloseAction);
     procedure FormShow (Sender: TObject);
     procedure DateClose(sender : Tobject);
     procedure lbClick(Sender: TObject);
     procedure sp2click(Sender: TObject);
    procedure RD_BINClick(Sender: TObject);
    procedure RD_TIMmClick(Sender: TObject);
    procedure RD_DIRClick(Sender: TObject);
    procedure RD_MVISClick(Sender: TObject);
    procedure RD_MTIPOClick(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);


  { Private declarations }
  private
    FiDom: oDominios;
    FCLASSE: INTEGER;
    FCLIENTE: INTEGER;
    FCENARIO: INTEGER;
     procedure Mostra_Objeto(pNome : string);
     function  consiste : boolean;
     procedure ooMap;
    procedure SetiDom(const Value: oDominios);
    procedure SetCENARIO(const Value: INTEGER);
    procedure SetCLASSE(const Value: INTEGER);
    procedure SetCLIENTE(const Value: INTEGER);

  
   { Public declarations }
  public

    { Published declarations }
  published
     property iObj;           
     property iDom : oDominios  read FiDom write SetiDom;
     property CLIENTE : INTEGER  read FCLIENTE write SetCLIENTE;
     property CENARIO : INTEGER  read FCENARIO write SetCENARIO;
     property CLASSE : INTEGER  read FCLASSE write SetCLASSE;


     function  Mostra_Campos : boolean;

   
  end;

var
  FRM_METOD: TFRM_METOD;

implementation

{$R *.dfm}



{ Popula os campos do Objeto de negócio com os edit da tela} 
procedure TFRM_METOD.ooMap;
 begin
    If self.CLI_ID.text = '' then
      (iObj as OMetodos).CLI_ID           := 0 
    else
      (iObj as OMetodos).CLI_ID          := StrtoInt(self.CLI_ID.text);
    If self.PRJ_ID.text = '' then
      (iObj as OMetodos).PRJ_ID           := 0 
    else
      (iObj as OMetodos).PRJ_ID          := StrtoInt(self.PRJ_ID.text);
    If self.IDF_CODIGO.text = '' then
      (iObj as OMetodos).IDF_CODIGO       := 0 
    else
      (iObj as OMetodos).IDF_CODIGO      := StrtoInt(self.IDF_CODIGO.text);
    If self.CLASS_ID.text = '' then
      (iObj as OMetodos).CLASS_ID         := 0 
    else
      (iObj as OMetodos).CLASS_ID        := StrtoInt(self.CLASS_ID.text);
    If self.IDF_SEQ.text = '' then
      (iObj as OMetodos).IDF_SEQ          := 0 
    else
      (iObj as OMetodos).IDF_SEQ         := StrtoInt(self.IDF_SEQ.text);
   (iObj as OMetodos).IDF_CAT         := self.IDF_CAT.text;
   (iObj as OMetodos).IDF_DEL         := self.IDF_DEL.text;
   (iObj as OMetodos).IDF_DESIGNACAO  := self.IDF_DESIGNACAO.text;
   (iObj as OMetodos).IDF_DIRETORIO   := self.IDF_DIRETORIO.text;
   (iObj as OMetodos).IDF_METBIND     := self.IDF_METBIND.text;
   (iObj as OMetodos).IDF_METDIRECT   := self.IDF_METDIRECT.text;
   (iObj as OMetodos).IDF_METTYPE     := self.IDF_METTYPE.text;
   (iObj as OMetodos).IDF_OBJETIVO    := self.IDF_OBJETIVO.text;
   (iObj as OMetodos).IDF_RESPONSAVEL := self.IDF_RESPONSAVEL.text;
   (iObj as OMetodos).IDF_TIPO        := self.IDF_TIPO.text;
   (iObj as OMetodos).IDF_TIPO_ATIVIDADE:= self.IDF_TIPO_ATIVIDADE.text;
   (iObj as OMetodos).IDF_VERSAO      := self.IDF_VERSAO.text;
   If self.IDF_VERSAO_DATA.text <> '' then
     (iObj as OMetodos).IDF_VERSAO_DATA := Strtodate(self.IDF_VERSAO_DATA.text)
   else
     (iObj as OMetodos).IDF_VERSAO_DATA := 0;
   (iObj as OMetodos).IDF_VISIBLE     := self.IDF_VISIBLE.text;
    If self.IDG_ID.text = '' then
      (iObj as OMetodos).IDG_ID           := 0 
    else
      (iObj as OMetodos).IDG_ID          := StrtoInt(self.IDG_ID.text);
   (iObj as OMetodos).LCK             := self.LCK.text;
   (iObj as OMetodos).MET_COMENT      := self.MET_COMENT.text;
   (iObj as OMetodos).MET_NOME        := self.MET_NOME.text;
   (iObj as OMetodos).MET_VISIBIL     := self.MET_VISIBIL.text;
   (iObj as OMetodos).ddmap;
 end;
  
  
procedure TFRM_METOD.FormCreate(Sender: TObject);
  begin;
   inherited;
    DBAtu := Tdb.create(TADOConnection);
   (Dbatu.DbTipo as TAdoConnection).connectionstring :=  bdx.connectionstring;

   iDom := oDominios.create;
   iObj := OMetodos.create;
 end;


  
procedure TFRM_METOD.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
  FRM_METOD := nil;
   action := cafree;
 end;

  
procedure TFRM_METOD.FormShow(Sender: TObject);
  begin;
   
  (iObj AS oMetodos).CLI_ID := Cliente;
  (iObj AS oMetodos).PRJ_ID:= cenario;
  (iObj AS oMetodos).CLASS_ID := Classe;
  (iObj AS oMetodos).ddMap;
   Inherited;
   iDom.DI_TIPO := 'PRP';
   iDom.ddMap;
   iDom.GetAll;
   rd_mvis.Items := iDom.Lista;

   iDom.DI_TIPO := 'FMT';
   iDom.ddMap;
   iDom.GetAll;
   rd_mtipo.items := iDom.Lista;

   iDom.DI_TIPO := 'TIM';
   iDom.ddMap;
   iDom.GetAll;
   rd_timm.Items := iDom.Lista;

   iDom.DI_TIPO := 'DIR';
   iDom.ddMap;
   iDom.GetAll;
   rd_dir.items := iDom.Lista;

   iDom.DI_TIPO := 'BIN';
   iDom.ddMap;
   iDom.GetAll;
   rd_bin.items := iDom.Lista;
 end;

   
procedure TFRM_METOD.sp2click(Sender: TObject);
  Begin  
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin 
          (iObj as OMetodos).GetProperties; 
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OMetodos).IDF_DESIGNACAO,iObj.PK);
        end;
      end
   else 
        begin 
         lb.Items[lb.ItemIndex] := (iObJ as OMetodos).IDF_DESIGNACAO
        end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} 
function TFRM_METOD.Consiste : boolean;
 begin
   inherited;
   result := true;
   // If self.IDF_CAT.text ='' then
  //       raise exception.create('Informar o campo Categoria');
    If self.IDF_DESIGNACAO.text ='' then
         raise exception.create('Informar o campo Designacao');
   { If self.IDF_METBIND.text ='' then
         raise exception.create('Informar o campo Bind');
    If self.IDF_METDIRECT.text ='' then 
         raise exception.create('Informar o campo Direct');
    If self.IDF_METTYPE.text ='' then 
         raise exception.create('Informar o campo Type');  }
    If self.IDF_OBJETIVO.text ='' then 
         raise exception.create('Informar o campo Objetivo');
    If self.IDF_TIPO.text ='' then 
         raise exception.create('Informar o campo Tipo');
  {  If self.IDF_TIPO_ATIVIDADE.text ='' then
         raise exception.create('Informar o campo Tipo Ati'); }
    If self.MET_NOME.text ='' then 
         raise exception.create('Informar o campo Nome');
    If self.MET_VISIBIL.text ='' then 
         raise exception.create('Informar o campo Visibilidade');
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_METOD.Mostra_Campos : boolean;
 begin
   (iObj as OMetodos).GetProperties;
   self.CLI_ID.text                   := InttoStr((iObj as OMetodos).CLI_ID);
   self.PRJ_ID.text                   := InttoStr((iObj as OMetodos).PRJ_ID);
   self.IDF_CODIGO.text               := InttoStr((iObj as OMetodos).IDF_CODIGO);
   self.CLASS_ID.text                 := InttoStr((iObj as OMetodos).CLASS_ID);
   self.IDF_SEQ.text                  := InttoStr((iObj as OMetodos).IDF_SEQ);
   self.IDF_CAT.text                  := (iObj as OMetodos).IDF_CAT;
   self.IDF_DEL.text                  := (iObj as OMetodos).IDF_DEL;
   self.IDF_DESIGNACAO.text           := (iObj as OMetodos).IDF_DESIGNACAO;
   self.IDF_DIRETORIO.text            := (iObj as OMetodos).IDF_DIRETORIO;
   self.IDF_METBIND.text              := (iObj as OMetodos).IDF_METBIND;
   self.IDF_METDIRECT.text            := (iObj as OMetodos).IDF_METDIRECT;
   self.IDF_METTYPE.text              := (iObj as OMetodos).IDF_METTYPE;
   self.IDF_OBJETIVO.text             := (iObj as OMetodos).IDF_OBJETIVO;
   self.IDF_RESPONSAVEL.text          := (iObj as OMetodos).IDF_RESPONSAVEL;
   self.IDF_TIPO.text                 := (iObj as OMetodos).IDF_TIPO;
   self.IDF_TIPO_ATIVIDADE.text       := (iObj as OMetodos).IDF_TIPO_ATIVIDADE;
   self.IDF_VERSAO.text               := (iObj as OMetodos).IDF_VERSAO;
    If (iObj as OMetodos).IDF_VERSAO_DATA > 0 then
     self.IDF_VERSAO_DATA.text          := DatetoStr((iObj as OMetodos).IDF_VERSAO_DATA);
   self.IDF_VISIBLE.text              := (iObj as OMetodos).IDF_VISIBLE;
   self.IDG_ID.text                   := InttoStr((iObj as OMetodos).IDG_ID);
   self.LCK.text                      := (iObj as OMetodos).LCK;
   self.MET_COMENT.text               := (iObj as OMetodos).MET_COMENT;
   self.MET_NOME.text                 := (iObj as OMetodos).MET_NOME;
   self.MET_VISIBIL.text              := (iObj as OMetodos).MET_VISIBIL;

   rd_bin.ItemIndex                  := rd_bin.Items.IndexOf(uppercase(self.IDF_METBIND.text)) ;
   rd_timm.ItemIndex                  := rd_timm.Items.IndexOf(uppercase(self.IDF_METTYPE.text)) ;
   rd_DIR.ItemIndex                  := rd_DIR.Items.IndexOf(uppercase(self.IDF_METDIRECT.text)) ;
   rd_mtipo.ItemIndex                  := rd_mtipo.Items.IndexOf(uppercase(self.idf_tipo.text)) ;
   rd_mvis.ItemIndex                  := rd_mvis.Items.IndexOf(uppercase(self.MET_VISIBIL.text)) ;
 end;
  
{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_METOD.Mostra_Objeto(pNome : string);
 begin
    self.CLI_ID.text   := inttostr(CLIENTE);
   self.PRJ_ID.text   := inttostr(CENARIO);
   self.CLASS_ID.text := inttostr(CLASSE);

   (iObj as oMetodos).ddMap;
   iObj.Load(pNome);
   Mostra_Campos;
   //spb_del.Enabled := true;
   //sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox} 
procedure TFRM_METOD.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
 end;
  
{Evento do Close Up datetimePicker}
procedure TFRM_METOD.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_IDF_VERSAO_DATA' then 
      begin
            IDF_VERSAO_DATA.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;
  
    
{Evento do Elimina}
procedure TFRM_METOD.SetiDom(const Value: oDominios);
begin
  FiDom := Value;
end;

procedure TFRM_METOD.SetCENARIO(const Value: INTEGER);
begin
  FCENARIO := Value;
end;

procedure TFRM_METOD.SetCLASSE(const Value: INTEGER);
begin
  FCLASSE := Value;
end;

procedure TFRM_METOD.SetCLIENTE(const Value: INTEGER);
begin
  FCLIENTE := Value;
end;

procedure TFRM_METOD.RD_BINClick(Sender: TObject);
begin
  inherited;
  self.IDF_METBIND.text := rd_bin.Items[rd_bin.itemindex];
end;

procedure TFRM_METOD.RD_TIMmClick(Sender: TObject);
begin
  inherited;
  self.IDF_METTYPE.text := rd_timm.Items[rd_timm.itemindex];
end;

procedure TFRM_METOD.RD_DIRClick(Sender: TObject);
begin
  inherited;
  self.IDF_METDIRECT.text := rd_dir.Items[rd_dir.itemIndex];
end;

procedure TFRM_METOD.RD_MVISClick(Sender: TObject);
begin
  inherited;
  self.MET_VISIBIL.text := rd_mvis.Items[rd_mvis.itemindex];
end;

procedure TFRM_METOD.RD_MTIPOClick(Sender: TObject);
begin
  inherited;
 self.IDF_TIPO.text := rd_MTIPO.Items[rd_mtipo.itemindex];
end;

procedure TFRM_METOD.sp_insertClick(Sender: TObject);
begin
  inherited;
  self.CLI_ID.text   := inttostr(CLIENTE);
   self.PRJ_ID.text   := inttostr(CENARIO);
   self.CLASS_ID.text := inttostr(CLASSE);
   self.IDF_TIPO_ATIVIDADE.Text := 'MT';
end;

end.
