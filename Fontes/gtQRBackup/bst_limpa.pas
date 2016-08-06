unit bst_limpa;

interface
{  Elimina das tabelas de objetos todas as referencias que não constam
   de nenhum diagrama.

   Procedimentos :
   - '' em todos os atributos IDF_DEL  das tabelas de objetos  .
   - Carrega as dimensões visíveis.
   - Abre todos os diagramas lógicos do Cliente/cenário
     . Abre todos os diagramas físicos correspondentes .
     . Inclui todos os objetos encontrados na tabela IDF__LIMPA
     . Marca com S no atributo IDF_DEL, todos os objetos lógicos encontrados na tabelas
       de objetos e não existentes na tabela IDF_LIMPA (objetos físicos).
     . Marca com S todos os objetos lógicos invisíveis que não possuem correlações com nenhum;
      objeto
   - Deleta todas as correlações soltas.
      }
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Grids, DBGrids, Buttons, ComCtrls,
  TPCProgressBars, DBCtrls, AxCtrls, OleCtrls,DBTables,bstdb,strutils, gtQrCtrls,bst_Basefrm,
  ImgList, ToolWin, AddFlow5Lib_TLB, AddFlow3Lib_TLB;

type
  Tfrm_limpa = class(TBasefrm)
    rd_tipo: TComboBox;
    dbg: TDBGrid;
    SP: TSpeedButton;
    sp_branco: TSpeedButton;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    sp_del: TSpeedButton;
    diagx: TAddFlow;
    SpeedButton1: TSpeedButton;
    {pb: TPCProgressBar;}
    Label1: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    pb: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure rd_tipoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sp_brancoClick(Sender: TObject);
    procedure SPClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sp_delClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Insere_Objeto(pcodigo : integer;pdesc : string; pTipo : string);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);



  private
    FFirst: boolean;
    procedure SetFirst(const Value: boolean);
    procedure Mostra;
    procedure carrega_Ativ;
    procedure Del_corr;
    procedure deleta_anormais;
    { Private declarations }
  public
    { Public declarations }
    procedure LoadConstantObj;override;
  published
     property First : boolean read FFirst write SetFirst;
  end;

  type
  uLst = ^TLst;
  TLst = record
     fCodigo : integer;

  end;

var
  frm_limpa: Tfrm_limpa;
  Aclasse : array[1..11] of string;
  Aclassed : array[1..11] of string;
  WNomediag ,mens,Wtab: string;
  Obj_Tipo : string;
  Wobjeto : afNode;
  Wrel : aflink;
  Diagx: TAddFlow  ;
  wdelet : tstringlist;
  Lmp_Classdg : string;
  iDiag : TDiag_Dados;
  iTab : Tdados_tab;
  mList : TList;

implementation

uses bst_main, bst_log;


{$R *.DFM}

procedure Tfrm_limpa.LoadConstantObj;
begin
 inherited  ;

  Caption :=  defc15;//'Compactação' ;
  SP.Caption := defe9;// 'Eliminar Todas Entidades Orfãs'  ;
  sp_branco.Caption := defe10;//'Eliminar Descrições em branco'   ;
  Label5.Caption := defe11;//'Entidades sem correspondentes nos Diagramas'   ;
  sp_del.Caption := defe12;//'Eliminar Entidades selecionadas' ;
  SpeedButton1.Caption := defi3;//'Iniciar                                     ' ;
  Label3.Caption := Mensreg8_8;//def65;//'Empresa .'  ;
  Label4.Caption := defc16;//'Cenário   .'  ;
  //Label2.Caption := '                  '  ;
 // Label1.Caption := ''  ;
     
end;

procedure Tfrm_limpa.Del_corr;   //delete correlações soltas
var
 i : integer;
 iCorr : Tdados_tab;
 Begin
   try
     If frm_log = nil then
        frm_log := Tfrm_log.create(self);
     frm_log.show;
     iCorr :=  tDados_tab.create(self);
     for i := 1 to length(wobj) do
     Begin
      frm_log.Memo1.Lines.add(Mens93+WTIT[I]);
      iCorr.Apaga_CorrpaiSolto(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,wobj[i]);
      iCorr.Apaga_CorrFilhoSolto(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,wobj[i]);
     end;

   finally
     frm_log.close;
     freeandnil(iCorr);
   end;


 end;

procedure Tfrm_limpa.carrega_Ativ
;   //carrega o combo c/ dimensões
var
i : integer;
 begin
     rd_tipo.items.clear;
     for i := 1 to length(wobj) do
       begin
           rd_tipo.Items.add(wtit[i]);
       end;
       { Marca todas as tabelas com '' no atributo IDF_DEL}
       try
         If itab = nil then
            iTab        := Tdados_tab.create(self)  ;
         iTab.CLI_ID := CurrEmpresa.cenarios.CLI_ID;
         iTab.PRJ_ID := CurrEmpresa.cenarios.PRJ_ID;
         iTab.Resetar;   // reseta as tabelas )del ='')
       finally
         //freeandnil(iTab);
       end;
 end;

procedure Tfrm_limpa.FormCreate(Sender: TObject);
var
i : integer;

begin
   //rst := true;

   label1.caption := frm_main.lb_cli.Caption;
   label2.caption := frm_main.lb_cen.Caption;
   label1.repaint;
   //label2.repaint;
   { Deleta tudo da tabela IDF_LIMPA}
   with TLimpa.create(self) do
     begin
        limpa;
        free;
     end;
   iDiag         := TDiag_dados.create(self);
   iDiag.CLI_ID  := CurrEmpresa.cenarios.CLI_ID;
   iDiag.PRJ_ID  := CurrEmpresa.cenarios.PRJ_ID;
   frm_main.Lb_Dg.Clear;
   wdir := bdx.DirFluxo;
end;

procedure Tfrm_limpa.Insere_Objeto(pcodigo : integer;pdesc : string; pTipo : string);
var                { inclui na tabela idf_limpa }
iLimp : TLimpa;
i : integer;
ap : string;
begin
  try
    AP := CHR(39);
    iLimp := TLimpa.create(self);
    iLimp.CODIGO := pCodigo;
    i := pos(ap,pdesc);
    If i > 0 then
      pdesc := leftstr(pdesc,i-1)+rightstr(pdesc,length(pdesc)-(i+1));
    iLimp.DESIGNACAO := pdesc;
    iLimp.TIPO  := pTipo;
    iLimp.Adeletar;
  finally
     freeandnil(iLimp);
  end;

end;

procedure Tfrm_limpa.rd_tipoChange(Sender: TObject);
 var
  Tot,i,j,TotLink,Wcod, TotDiag: integer;
  wativ ,sq: string;

  Const Ws = 'S';
  Const WB = ' ';

begin
  If wobj[rd_tipo.ItemIndex+1] = 'AC' then // aspectos críticos
    exit;

  dbg.columns[0].title.caption := rd_tipo.items[rd_tipo.ItemIndex ];
  rd_tipo.repaint;
  { Trata objetos invísiveis}
  If (wVis[rd_tipo.ItemIndex +1] = 'N')  then // entidade externa

   begin
     dbg.DataSource := nil;
     If iTab = nil then
        iTab := Tdados_tab.Create(self) ;
     with itab do
      begin
       CLI_ID :=  cURReMPRESA.cenarios.CLI_ID;
       PRJ_ID :=  cURReMPRESA.cenarios.PRJ_ID;
       MarcadelInvisivel(wobj[rd_tipo.ItemIndex+1]);
       dbg.DataSource := DataExt;
       Mostra_orfas(wobj[rd_tipo.ItemIndex+1]);  //mostra os objetos a deletar
      // free;
      end;
   end
 else
   Mostra ;

 sp.enabled        := true;
 sp_del.enabled    := true;
 sp_branco.enabled := true;
end;




procedure Tfrm_limpa.Mostra;
begin
     try
       dbg.DataSource := nil;
       If itab = nil then
          iTab := Tdados_tab.create(self);
       iTab.CLI_ID := cURReMPRESA.cenarios.CLI_ID;
       iTab.PRJ_ID := cURReMPRESA.cenarios.PRJ_ID;
       Itab.MarcaDel(wobj[rd_tipo.ItemIndex+1]); // Marca com S todas as tabelas com objetos físicos inexistentes
       dbg.DataSource := itab.DataExt;
       iTab.Mostra_orfas(wobj[rd_tipo.ItemIndex+1]);  // mostra os objetos orfões
     finally
     end;
end;



procedure Tfrm_limpa.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
  wnode : TtreeNode;
begin

  frm_limpa := nil;
  action := cafree;
  freeandNil(itab);

end;


procedure Tfrm_limpa.sp_brancoClick(Sender: TObject);
var
iObj : TDados_tab;
begin
  try
     iObj := Tdados_tab.create(self);
     with iObj do
      begin
         CLI_ID :=  cURReMPRESA.cenarios.CLI_ID;
         PRJ_ID :=  cURReMPRESA.cenarios.PRJ_ID;
         LimpaNull(wobj[rd_tipo.ItemIndex+1]) ;
      end;

  finally
     freeandnil(iObj);
  end;

  Mostra;
end;


procedure Tfrm_limpa.SPClick(Sender: TObject);

var
iObj : TDados_tab;
begin

  try
     iObj := Tdados_tab.create(self);
     with iObj do
      begin
         CLI_ID :=  cURReMPRESA.cenarios.CLI_ID;
         PRJ_ID :=  cURReMPRESA.cenarios.PRJ_ID;
         Limpa_Todas(wobj[rd_tipo.ItemIndex+1]) ;
      end;

  finally
     freeandnil(iObj);
  end;

  iTab.Mostra_orfas(wobj[rd_tipo.ItemIndex+1]);  // mostra os objetos orfões
end;

procedure Tfrm_limpa.SpeedButton5Click(Sender: TObject);
begin
  del_corr;
  close;
end;


procedure Tfrm_limpa.sp_delClick(Sender: TObject);
var
i ,j : integer;
iObj : Tdados_tab;
wtab : string;
begin
  //DBN.BtnClick(nbdelete);
  try
   wtab := 'IDF_'+wobj[rd_tipo.ItemIndex+1];
   iTab := Tdados_tab.create(self);
   with DBG.DataSource.DataSet do
      for i:= 0 to DBG.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(DBG.SelectedRows.Items[i]));

        If wTab = 'IDF_CS' then
         begin
          With Tidf_cs.create(self) do
           Del_Object(Currempresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,
                          DBG.DataSource.DataSet.fieldbyname('IDF_CODIGO').value);
           free;

         end
       else
        iTab.Apaga_Objeto(Currempresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,
                          fieldbyname('IDF_CODIGO').value,wtab);


      end;
  finally
     //freeandnil(iObj);
  end;
  dbg.DataSource := iTab.DataExt;
  iTab.Mostra_orfas(wobj[rd_tipo.ItemIndex+1]);


end;

procedure Tfrm_limpa.FormActivate(Sender: TObject);
begin
  FRM_LIMPA.REPAINT;
end;

procedure Tfrm_limpa.SetFirst(const Value: boolean);
begin
  FFirst := Value;
end;

procedure Tfrm_limpa.Button1Click(Sender: TObject); { Carrega todos os códigos dos objetos  }
var                                                 {físicos (entidades e fluxos de dados }
 Tot,i,j,TotLink,Wcod, TotDiag: integer;            { na tabela IDF_LIMPA}
 wativ ,sq: string;

begin
   If MessageDlg(mens50, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

    { Trata objetos físicos}

   TotDiag        := iDiag.TotalDiag;
   pb.Min         := 0;
   pb.Max         := TotDiag;
   pb.Visible     := true;
   { abre todos os diagramas do cliente/projeto}
  iDiag.Open_Diagramas(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID);

  while not iDiag.eof do
     Begin
        If Wdir <> '' then
           WNomeDiag := Wdir + iDiag.fieldbyname('diag_id').asstring
        else
          raise exception.create(mens94+Wdir);

        If FileExists(WNomeDiag) then    // abre o diagrama físico...
          Begin           // inclui entitiy na tabela
             Diagx.Loadfile(WNomeDiag);
             lmp_ClassDg := iDiag.fieldbyname('Idg_Dir').asstring;
             If (lmp_ClassDg = 'DPN') or
                (lmp_ClassDg = 'DUC') or
                (lmp_ClassDg = 'DMI') or
                (lmp_ClassDg = 'CLS') or
                (lmp_ClassDg = 'DEO') then
                begin
                   Diagx.selectall;
                   Tot := Diagx.selnodes.count;
                   totLink := Diagx.SelLinks.count; // links entrando e saindo

                   // insere o proprio diagrama como atividade
                   Insere_Objeto(iDiag.fieldbyname('Idg_iD').value,Wativ,'AP');

                   for i := 1 to tot do
                   Begin
                     Wobjeto := diagx.SelNodes.item(i);

                     case WObjeto.Shape of
                        11,54,50,62,79 : Obj_Tipo := 'AP';
                        56,59,65       : Obj_Tipo := 'EN';
                        55             : Obj_Tipo := 'EE';
                        14             : Obj_Tipo := 'RN';
                        58,15          : Obj_Tipo := 'OI';
                        8              : Obj_Tipo := 'OI';
                        0              : Obj_Tipo := 'OE';
                        1              : begin
                                         If lmp_ClassDg = 'DMI' then
                                           Obj_Tipo := 'IF'
                                         else
                                         If lmp_ClassDg = 'CLS' then
                                           Obj_Tipo := 'CS' ;
                                         end;
 
                        2              : Obj_Tipo := 'JU';
                        9,53           : Obj_Tipo := 'CA';
                        61             : Obj_Tipo := 'PS';
                     else
                          Obj_Tipo := '';
                     end;

                     WCod  := Wobjeto.Userdata;
                     Wativ := Wobjeto.text;
                     If Obj_tipo <> '' then
                        Insere_Objeto(Wcod,Wativ,Obj_Tipo); //inclui na tabela contendo objetos do diagrma
                   end;

                   for j := 1 to TotLink do
                   begin
                      Wrel := Diagx.SelLinks.item(j);
                      WCod := WRel.Userdata;
                      case WRel.LinkStyle of
                        2,5,9,6 : Obj_Tipo := 'DG';
                      else
                        Obj_Tipo := '';
                      end;
                      Wativ := Wrel.text;
                      If Obj_tipo <> '' then
                         Insere_Objeto(Wcod,Wativ,Obj_Tipo); // insere fluxo de dados na tabela a deletar
                   end;
                end;
               pb.Position := pb.position + 1;
               pb.repaint;
          end;
              //TODO -c6.00.026 : Corrigido : delete os objetos fora de padrão (erros)
         If iDiag.fieldbyname('IDG_DIR').asstring = 'DPN' then
             deleta_anormais;

     iDiag.next;
     end;

    carrega_ativ;
    pb.Visible := false;
end;


procedure Tfrm_limpa.deleta_anormais  ;
var
i ,j,links_count: integer;
wobjeto : afNode;
ok : boolean;
begin
  If  diagx.Nodes.Count = 0 then
   exit;
  for i := 1 to Diagx.Nodes.Count do
    Begin
       wobjeto := Diagx.Nodes.Item(i);
       ok := false;
       If (Wobjeto.Shape in [0,1] ) and (Wobjeto.selectable = false) then
          Begin
           If (wObjeto.Links.Count = 0)  then
              ok := true 
           else
            begin
              for j := 1 to wObjeto.Links.Count do
                begin
                 If wObjeto.Links.Item(j).LinkStyle = 3 then
                  begin
                    If  wObjeto.Links.Item(j).Dst = nil then
                      OK := true
                  end
                  
                 else
                  begin
                    ok := false;
                    break ;
                  end;
                end;
            end;
            If Ok then
              begin
                 wobjeto.Marked := true  ;
                 Ok := false;
                 showmessage(wobjeto.Text);

              end;
              
          end;
    end;

      diagx.DeleteMarked;
      diagx.SaveFile(WnomeDiag);

end;

procedure Tfrm_limpa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If ord(key) = 27 then
   FormCreate(self);
end;

procedure Tfrm_limpa.SpeedButton2Click(Sender: TObject);
begin
   del_corr;
end;

procedure Tfrm_limpa.ToolButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
