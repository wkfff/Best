unit bst_Escaspect;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons,bstdb,cls_utils, QuickRpt, Qrctrls, gtQrCtrls;

type
  Tfrm_escaspect = class(TBaseFRm)
    rd1: TRadioGroup;
    rd2: TRadioGroup;
    rd3: TRadioGroup;
    conc: TSpeedButton;
    rdg3: TRadioGroup;
    rdg_sit: TRadioGroup;
    lb_dim: TListBox;
    Label1: TLabel;
    lb_selected: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure concClick(Sender: TObject);
    procedure Lista_Aspectos(pCli,pProj : integer;pButton : TSpeedButton);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Lista_Aspectos1(pCli, pProj: integer; pButton: TSpeedButton);
    
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_escaspect: Tfrm_escaspect;

implementation

uses bst_cimp, bst_pac, bst_main, bst_pac1;



{$R *.DFM}

procedure Tfrm_escaspect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_escaspect    := nil;
  action := caFree;
end;

procedure Tfrm_escaspect.concClick(Sender: TObject);
 begin
  If rdg_sit.ItemIndex < 0 then
   Raise exception.create(mens90);
 //  showmessage( TSpeedButton(Sender as TObject).Caption);
 { If  TSpeedButton(Sender as TObject).tag <> 1 then
        Lista_aspectos(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,TSpeedButton(Sender as TObject))
 else  }
  Begin
  // If  (rdg3.ItemIndex = 0) then
    Lista_aspectos(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,TSpeedButton(Sender as TObject))
  // else
  //  Lista_aspectos1(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,TSpeedButton(Sender as TObject))
  end;
 end;

procedure Tfrm_escaspect.Lista_Aspectos(pCli,pProj : integer;pButton : TSpeedButton);
var
i ,j: integer;
iAsp : Tdados_tab;
ptit : string;
pForce : boolean;
begin
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := frm_escAspect.caption;
  pTit :=  frm_escAspect.caption;
  
  frm_Cimp.showModal;
  If canc then
     exit;
  iAsp := Tdados_tab.create(self);

  with iAsp do
   begin
    close;
    Connection := BDx;
    sql.clear;
    sql.add('SELECT * FROM IDF_AC A ');
    sql.add(' WHERE A.CLI_ID = '+''+inttostr(pCLI)+'');
    If pButton.tag = 1 then
      sql.add(' AND A.IDF_TIPO__ASPECTO = '+''''+'AC'+'''')
    else
      sql.add(' AND A.IDF_TIPO__ASPECTO = '+''''+'AM'+'''') ;

     If RDG_SIT.ItemIndex <> rdg_sit.Items.Count -1 then    //o ultimo é todos
       sql.add(' AND A.IDF_STATUS = '+''''+RDG_SIT.items[RDG_SIT.ITEMINDEX]+'''') ;

    lb_selected.Clear;
    lb_dim.CopySelection(lb_selected);
    If Lb_Selected.Items.Count > 0 then
     Begin
      for j := 0 to lb_selected.Items.count - 1 do
       Begin
         Begin
           If j = 0 then
             sql.add(' AND (A.DIMENSAO = '+''''+lb_selected.items[J]+'''')
           else
             sql.add(' OR A.DIMENSAO = '+''''+lb_selected.items[J]+'''') ;
         end;

       end;
        sql.add(')') ;
     end;


    Case rd1.ItemIndex of
      0 : sql.add(' ORDER BY A.IDF_ID');
      1 : sql.add(' ORDER BY A.IDF_DESIGNACAO');
      2 : sql.add(' ORDER BY A.IDF_CODIGO');
      3 : sql.add(' ORDER BY A.IDF_UPDATE_DATE');
      4 : sql.add(' ORDER BY A.IDF_RESPONSAVEL');
      5 : sql.add(' ORDER BY A.DIMENSAO');
    end;
    Case rd2.ItemIndex of
      0 : sql.add(',A.IDF_ID');
      1 : sql.add(',A.IDF_DESIGNACAO');
      2 : sql.add(',A.IDF_CODIGO');
      3 : sql.add(',A.IDF_UPDATE_DATE');
      4 : sql.add(',A.IDF_RESPONSAVEL');
      5 : sql.add(', A.DIMENSAO');
    end;
    Case rd3.ItemIndex of
      0 : sql.add(',A.IDF_ID');
      1 : sql.add(',A.IDF_DESIGNACAO');
      2 : sql.add(',A.IDF_CODIGO');
      3 : sql.add(',A.IDF_UPDATE_DATE');
      4 : sql.add(',A.IDF_RESPONSAVEL');
      5 : sql.add(',A.DIMENSAO');
    end;
    open;
    If eof then
       Begin
         Showmessage(defs20+' '+frm_escAspect.caption);
         close;
         exit;
       end;
   end;

   
  If  (rdg3.ItemIndex = 0) then
  begin
  If frm_pac = nil then
     frm_pac := Tfrm_Pac.create(self);
   with frm_pac do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],iAsp);
          end;
          //qrp.DataSet := iAsp;
         // qrDataset(qrsubdetail1,iTab);
      end;


   //frm_pac.titulo.caption      := pTit;
   If pButton.tag = 1 then
      frm_pac.pcausa.DataField := 'IDF_ASPECTOS_CRITICOS'
   else
      frm_pac.pcausa.DataField := 'IDF_ALVOS_MELHORIA';
    frm_pac.qrband1.ForceNewPage := wForceNewpage;
   If prev then
      //frm_pac.qrp.preview
   else
      frm_pac.print;

   frm_pac.close;
   end
   else
   begin
   If frm_pac1 = nil then
     frm_pac1 := Tfrm_pac1.create(self);

   with frm_pac1 do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],iAsp);
          end;
          //qrp.DataSet := iAsp;
      end;
   
   //frm_pac1.titulo.caption      := pTit;
    frm_pac1.qrband1.ForceNewPage := wForceNewpage;
   If prev then
      //frm_pac1.qrp.preview
   else
      //frm_pac1.print;
   frm_pac1.close;
   end;
   close;

end;
procedure Tfrm_escaspect.Lista_Aspectos1(pCli,pProj : integer;pButton : TSpeedButton);
var
i ,J: integer;
iAsp : Tdados_tab;
begin

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := frm_escAspect.caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  iAsp := Tdados_tab.create(self);

  with iAsp do
   begin
    close;
    Connection := BDx;
    sql.clear;
    sql.add('SELECT * FROM IDF_AC A ');
    sql.add(' WHERE A.CLI_ID = '+''+inttostr(pCLI)+'');
  //  sql.add(' AND A.PRJ_ID  = '+''+inttostr(pPROJ)+'');
    sql.add(' AND A.IDF_DESIGNACAO  <> '+''''+''+'''');
     
  {  If uppercase(RDG_SIT.items[RDG_SIT.ITEMINDEX]) <> deft16  then
       sql.add(' AND A.IDF_STATUS = '+''''+RDG_SIT.items[RDG_SIT.ITEMINDEX]+'''') ;  }

    If RDG_SIT.ItemIndex <> rdg_sit.Items.Count -1 then    //o ultimo é todos
       sql.add(' AND A.IDF_STATUS = '+''''+RDG_SIT.items[RDG_SIT.ITEMINDEX]+'''') ;

    lb_selected.Clear;
    lb_dim.CopySelection(lb_selected);
    If Lb_Selected.Items.Count > 0 then
     Begin
      for j := 0 to lb_selected.Items.count - 1 do
       Begin
       //  If lb_dim.Items[j].
         Begin
           If j = 0 then
             sql.add(' AND (A.DIMENSAO = '+''''+lb_selected.items[J]+'''')
           else
             sql.add(' OR A.DIMENSAO = '+''''+lb_selected.items[J]+'''') ;

         end;

       end;
        sql.add(')') ;
     end;
    Case rd1.ItemIndex of
      0 : sql.add(' ORDER BY A.IDF_ID');
      1 : sql.add(' ORDER BY A.IDF_DESIGNACAO');
      2 : sql.add(' ORDER BY A.IDF_CODIGO');
      3 : sql.add(' ORDER BY A.IDF_UPDATE_DATE');
      4 : sql.add(' ORDER BY A.IDF_RESPONSAVEL');
      5 : sql.add(' ORDER BY A.DIMENSAO');
    end;
    Case rd2.ItemIndex of
      0 : sql.add(',A.IDF_ID');
      1 : sql.add(',A.IDF_DESIGNACAO');
      2 : sql.add(',A.IDF_CODIGO');
      3 : sql.add(',A.IDF_UPDATE_DATE');
      4 : sql.add(',A.IDF_RESPONSAVEL');
      5 : sql.add(',A.DIMENSAO');
    end;
    Case rd3.ItemIndex of
      0 : sql.add(',A.IDF_ID');
      1 : sql.add(',A.IDF_DESIGNACAO');
      2 : sql.add(',A.IDF_CODIGO');
      3 : sql.add(',A.IDF_UPDATE_DATE');
      4 : sql.add(',A.IDF_RESPONSAVEL');
      5 : sql.add(',A.DIMENSAO');
    end;

   // showmessage(sql.Text);
    open;
    If eof then
       Begin
         Showmessage(defs20+' '+frm_escAspect.caption);
         close;
         exit;
       end;
   end;

  If frm_pac1 = nil then
     frm_pac1 := Tfrm_pac1.create(self);

   with frm_pac1 do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],iAsp);
          end;
        //qrp.DataSet := iAsp;

      end;
   //frm_pac1.titulo.caption      := def40+'s';

   If prev then
      //frm_pac1.qrp.preview
   else
      frm_pac1.print;

   frm_pac1.close;
   close;

end;

procedure Tfrm_escaspect.SpeedButton1Click(Sender: TObject);
begin
  Lista_aspectos1(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,TSpeedButton(Sender as TObject));
end;

procedure Tfrm_escaspect.FormCreate(Sender: TObject);
begin
    with Tdominios.create(self) do
     Begin
        Open_Dominio('SIT',frm_main.Idioma);
        while not eof do
         Begin
          rdg_sit.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
         next;
         end;
         rdg_sit.items.add(deft16);
         rdg_sit.ItemIndex := rdg_sit.Items.Count-1;
         free;
     end;
  with Tdominios.create(self) do
 begin
  try
    begin
      Open_Dominio('DIM',frm_main.Idioma) ;
        while not eof do
         begin
           lb_dim.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
           next;
         end;
     end;
  finally
    free;
  end;
  end;

end;

procedure Tfrm_escaspect.Loadconstantobj;
var
i : integer;

begin
 inherited;
 //Caption           := def40;//'Aspectos Críticos'  ;
 conc.Caption      := defc31;//'Concluir' ;
 Label1.Caption    := defd1;//'Dimsões' ;
 rd1.Caption       := defc18+' '+ defp16;//Classificar por.....'  ;

 rd1.items[0]      := dim1;//'Operação'      ;
 rd1.items[1]      := defo2;//'Alfabética'      ;
 rd1.items[2]      := '#'      ;
 rd1.items[3]      := defp7;//'Prazo de Conclusão'      ;
 rd1.items[4]      := def450;//'Responsável'      ;
 rd1.items[5]      := defd11;//'Dimsão'     ;

 rd2.Caption       := defp16 +'...';//'e por ....'  ;

 rd2.items[0]      := dim1;//'Operação'      ;
 rd2.items[1]      := defo2;//'Alfabética'      ;
 rd2.items[2]      := '#'      ;
 rd2.items[3]      := defp7;//'Prazo de Conclusão'      ;
 rd2.items[4]      := def450;//'Responsável'      ;
 rd2.items[5]      := defd11;//'Dimsão'     ;

 rd3.Caption       := defp16 +'...';//'e por ....'  ;

 rd3.items[0]      := dim1;//'Operação'      ;
 rd3.items[1]      := defo2;//'Alfabética'      ;
 rd3.items[2]      := '#'      ;
 rd3.items[3]      := defp7;//'Prazo de Conclusão'      ;
 rd3.items[4]      := def450;//'Responsável'      ;
 rd3.items[5]      := defd11;//'Dimsão'     ;

 rdg3.Caption      := deft15;//'Tipo de Aprestação'   ;

 rdg3.items[0]     := def100051;//'Um Aspecto Crítico por Folha'      ;
 rdg3.items[1]     := defp15;//'Tabular'     ;

 rdg_sit.Caption   := 'Status'  ;

end;

end.

