unit EMPRESA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs,CONTATO_OO, CAD_STD, StdCtrls, ComCtrls, Menus, Buttons, ExtCtrls,
  Grids, Aligrid, DB, ADODB,basetier;

type
  TFRM_EMPRESA = class(TCAD_STD)
    grid_cont: TStringAlignGrid;
    ADOQuery1: TADOQuery;

    procedure FormCreate (sender : TObject);
    procedure FormClose (Sender: TObject; var Action: TCloseAction);
    procedure FormShow (Sender: TObject);
    procedure DateClose(sender : Tobject);
    procedure lbClick(Sender: TObject);
    procedure sp2click(Sender: TObject);
    procedure cmb_ativCloseUp(Sender: TObject);
    procedure cmb_paisCloseUp(Sender: TObject);
    procedure grid_contClick(Sender: TObject);
    procedure RDGClick(Sender: TObject);
    procedure cmb_listaCloseUp(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure COMMENTDblClick(Sender: TObject);
    procedure sp_printClick(Sender: TObject);


  { Private declarations }
  private
    FiAtiv: oAtividade;
    FiPais: oPais;
    FoContato: oContatos;
    Fincr: integer;
    
    function  consiste : boolean;
    procedure ooMap;
    procedure SetiAtiv(const Value: oAtividade);
    procedure SetiPais(const Value: oPais);
    function Mostra_Campos: boolean;
    function s: oPais;
    procedure SetoContato(const Value: oContatos);
    procedure Limpa_grid(pList: TStringAlignGrid);  //somente master

    {monta o cabeçalho do grid detalhe com titulo e atributos associados nas const cCaptoion e cCampos}
    procedure Monta_cab;
    procedure Setincr(const Value: integer);                            //somente master


   { Public declarations }
  public

    { Published declarations }
  published
     property iObj;
     procedure Mostra_Objeto(pNome : string);
     property incr : integer read Fincr write Setincr;
     procedure Mostra_Contatos;                      //somente master
  end;
 {definição dos campos a mostrar no grid (master-detail)}
const
 cCampos  : array [0..5] of string = ('nome','sobrenome','telefone_pess','celular','CIDADE','PAIS');
 cCaption : array [0..5] of string = ('Nome','Sobrenome','Tel.','Celular','Cidade','Pais');
 {fim definição dos campos a mostrar no grid (master-detail)}
 var
  FRM_EMPRESA: TFRM_EMPRESA;
  listField : string;
  larg_ant,alt_ant,top_ant,left_ant : integer;
implementation

{ início use}
uses
{ fim use}
{$R *.dfm}


procedure TFRM_EMPRESA.FormCreate(Sender: TObject);
  begin;
   inherited;
   iObj := OTempresas.create;
   grid_cont.DefaultRowHeight := 20;
   Monta_cab;
 end;


procedure TFRM_EMPRESA.Monta_cab;
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



procedure TFRM_EMPRESA.FormClose(Sender: TObject; var Action: TCloseAction);
  begin;
   Inherited;
   FRM_EMPRESA := nil;
   action := cafree;
 end;


procedure TFRM_EMPRESA.FormShow(Sender: TObject);
  begin;
   Inherited;
  // iObj := OTempresas.create;
  If lb.Count > 0 then
    begin
     lb.ItemIndex := 0;
     lbClick(nil);
     activecontrol := lb;
    end;
    
 end;


procedure TFRM_EMPRESA.sp2click(Sender: TObject);
  Begin
   If not Consiste then
     raise exception.create('Inclusão não efetuada!');
   oomap;
   inherited;
   If Status = 'I' then
      begin
        If iObj.ID > 0 then //gravou novo 
        begin
          (iObj as OTempresas).GetProperties;
          iObj.PK.PK1  := iObj.ID;
          lb.ItemIndex := lb.Items.AddObject((iObJ as OTempresas).FANTASIA,iObj.PK);
          Mostra_objeto(iObj.Getitem(lb));
        end;
      end;
 end;
  

   
{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização}
function TFRM_EMPRESA.Consiste : boolean;
 begin
   inherited;
   result := true;
    If self.FANTASIA.text ='' then 
         raise exception.create('Informar o campo Fantasia');
    If self.EMPRESA.text ='' then 
         raise exception.create('Informar o campo Empresa');
    If self.PAIS.text ='' then
         raise exception.create('Informar o campo Pais');
    If self.ATIV.text ='' then 
         raise exception.create('Informar o campo Atividade');
    self.DATAT.text := datetostr(date);
 end;


{ Popula os campos Edit com os atributos da tabela} 
function TFRM_EMPRESA.Mostra_Campos : boolean;
 begin
   (iObj as OTempresas).GetProperties;
   self.ID_EMP.text                   := (iObj as OTempresas).ID;
   self.FANTASIA.text                 := (iObj as OTempresas).FANTASIA;
   self.EMPRESA.text                  := (iObj as OTempresas).EMPRESA;
   self.CGC.text                      := (iObj as OTempresas).CGC;
   self.INSCR.text                    := (iObj as OTempresas).INSCR;
   self.ENDER.text                    := (iObj as OTempresas).ENDER;
   self.ESTADO.text                   := (iObj as OTempresas).ESTADO;
   self.CIDAD.text                    := (iObj as OTempresas).CIDAD;
   self.CEP.text                      := (iObj as OTempresas).CEP;
   self.PAIS.text                     := (iObj as OTempresas).PAIS;
   self.TELEF.text                    := (iObj as OTempresas).TELEF;
   self.TELEF1.text                   := (iObj as OTempresas).TELEF1;
   self.FAX.text                      := (iObj as OTempresas).FAX;
   self.E_MAIL.text                   := (iObj as OTempresas).E_MAIL;
   self.ATIV.text                     := (iObj as OTempresas).ATIV;
   self.COMMENT.text                  := (iObj as OTempresas).COMMENT;
   self.DATAT.text                    := DatetoStr((iObj as OTempresas).DATAT);
   self.TIPO.text                     := (iObj as OTempresas).TIPO;
   self.SITE.text                     := (iObj as OTempresas).SITE;
 end;

{ Popula os campos Edit com os atributos da tabela} 
procedure TFRM_EMPRESA.Mostra_Objeto(pNome : string);
 begin
   iObj.Load(pNome);
   Mostra_Campos;
   spb_del.Enabled := true;
   sp_Insert.Enabled := true;
 end;
  
{ Cria o click do ListBox}
procedure TFRM_EMPRESA.lbClick(Sender: TObject);
 begin
   Inherited;
   Mostra_objeto(iObj.Getitem(lb));
   Mostra_Contatos;   //somente master
 end;

{Evento do Close Up datetimePicker}
procedure TFRM_EMPRESA.DateClose(sender : TObject);
 Begin
  If uppercase(TDatetimePicker(sender as Tobject).name) = 'D_DATAT' then 
      begin
            DATAT.text := DateToStr(TDatetimePicker(sender as Tobject).date);
            exit;
      end;
 end;
  
    
{Evento do Elimina}
procedure TFRM_EMPRESA.SetiAtiv(const Value: oAtividade);
begin
  FiAtiv := Value;
end;

procedure TFRM_EMPRESA.cmb_ativCloseUp(Sender: TObject);
begin
  inherited;
  ativ.Text := cmb_ativ.Items[cmb_ativ.itemindex];
end;

procedure TFRM_EMPRESA.SetiPais(const Value: oPais);
begin
  FiPais := Value;
end;

procedure TFRM_EMPRESA.cmb_paisCloseUp(Sender: TObject);
begin
  inherited;
  pais.Text := cmb_pais.Items[cmb_pais.itemindex];
end;

function TFRM_EMPRESA.s: oPais;
begin

end;

procedure TFRM_EMPRESA.SetoContato(const Value: oContatos);
begin
  FoContato := Value;
end;

procedure TFRM_EMPRESA.Mostra_Contatos;   //somente master
var
i : integer;
begin
  inherited;
  Limpa_grid(Grid_cont);
  iContatos           := oContatos.create;
  iContatos.ListaGrid := Grid_cont;
  iContatos.GetContatos(iObj.Getitem(lb)) ;

end;

procedure TFRM_EMPRESA.Limpa_grid(pList : TStringAlignGrid);  //somente master
var
i,j,m,n : integer;
begin
  j := pList.FixedCols ;
  i := pList.FixedRows;
  for m := i to pList.RowCount-1 do
   begin
     for n := j to pList.ColCount-1 do
      pList.cells[n,m] := '';
   end;
end;

procedure TFRM_EMPRESA.grid_contClick(Sender: TObject);   //somente master
var
wpk : variant;
i : integer;
begin
  inherited;
  wpk := (grid_cont.Objects[0,grid_cont.row] as TPK).pk1 ;
  If frm_cont = nil then
     frm_cont := Tfrm_cont.create(self);
  frm_cont.Type_Form := 1;    //simples = detail
  frm_cont.Key_master := strtoint(iObj.Getitem(lb));
  frm_cont.Key_detail := wpk;
  frm_cont.Mostra_Objeto(wpk);
  frm_cont.showmodal;
  Mostra_Contatos;
end;

procedure TFRM_EMPRESA.RDGClick(Sender: TObject);
begin
  inherited;
  cmb_lista.Text := '';
  case rdg.ItemIndex of
  1 : begin
        cmb_Lista.Visible := true;
        cmb_lista.Items := cmb_ativ.Items;
        ListField := 'ATIV';

      end;
  2 : begin
        cmb_Lista.Visible := true;
        cmb_lista.Items := cmb_pais.Items;
        ListField := 'PAIS';
      end;
  end;

end;

procedure TFRM_EMPRESA.cmb_listaCloseUp(Sender: TObject);
begin
  inherited;

   (iObj as otempresas).ListadaAtividade(iObj,ListFIeld,cmb_Lista.Items[cmb_Lista.ItemIndex]);
    If iObj.lista <> nil then
    begin
     lb.items := iObj.Lista;
     lTot.Caption := 'Total : '+inttostr(lb.Items.count);
    end;
end;

procedure TFRM_EMPRESA.spb_delClick(Sender: TObject);
var
wid : integer;


begin

    wid := strtoint(iObj.Getitem(lb));
    If MessageDlg('A Eliminação da Empresa apagará todos os Contatos dessa Empresa! Continua ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
         inherited;
         If wid > 0 then
          begin
            with oContatos.Create do   //somente master
              begin
                Deletacontatos(wid);
                free;
              end;
          end;

       end;
end;



procedure TFRM_EMPRESA.COMMENTDblClick(Sender: TObject);
begin
  inherited;
  If comment.Top = 0 then
   begin
    comment.top    := top_ant;
    comment.left   := left_ant;
    comment.width  := larg_ant;
    comment.height := alt_ant;
   end
 else
   begin
    top_ant      :=    comment.top ;
    left_ant     :=    comment.left;
    larg_ant     :=    comment.width;
    alt_ant      :=    comment.height;


    comment.top    :=  0;
    comment.left   :=  0;
    comment.width  := width;
    comment.height := height;
    comment.BringToFront;

   end;
end;

procedure TFRM_EMPRESA.sp_printClick(Sender: TObject);
var
i,j: integer;
begin
  inherited;
  If frm_prt = nil   then
    frm_prt := Tfrm_prt.create(self);
  incr := -1;
  frm_prt.tit.Caption := frm_empresa.RDG.Items[frm_empresa.RDG.itemindex]  + '  -  '+frm_empresa.cmb_lista.items[frm_empresa.cmb_lista.itemindex]  ;
    frm_prt.qrp.Preview;
end;

procedure TFRM_EMPRESA.Setincr(const Value: integer);
begin
  Fincr := Value;
end;

END.

