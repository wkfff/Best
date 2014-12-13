unit bst_tabenga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DualList, StdCtrls, Buttons, bstdb, AddFlow3Lib_TLB, cls_obj,
  TPCProgressBars, DB, ADODB, fonctions, Animate, GIFCtrl,
  ImgList, ComCtrls, ToolWin;

type
  Tfrm_tabenga = class(TDualListDlg)
    gb: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    sp1: TSpeedButton;
    //pg_tab: TPCProgressBar;
    //pg_atrib: TPCProgressBar;
    adod: TADODataSet;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edit3: TLabel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcListDblClick(Sender: TObject);
    procedure sp1Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure DstListDblClick(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    function Pesq_provider(pProvider: string) : boolean;
    function RetDataTYpe (pProvider : string;pType : integer) : string;
    
    { Private declarations }
  public
    procedure Cria_provider(pProvider: string;adc : TADOConnection)   ;
    procedure LoadConstants;
  end;

var
  frm_tabenga: Tfrm_tabenga;

implementation

uses bst_bancos, bst_objetos, bst_treeAtiv, bst_main, bst_idiomas;

{$R *.dfm}

procedure Tfrm_tabenga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_treeAtiv.dir_canc := true;
  frm_tabenga := nil;
  action := cafree;
end;

procedure Tfrm_tabenga.SrcListDblClick(Sender: TObject);
begin
  inherited;
  IncludeBtnClick(self);
end;

procedure Tfrm_tabenga.sp1Click(Sender: TObject);
begin
  inherited;
   If frm_bancos = nil then
   frm_bancos := tfrm_bancos.create(self);
  frm_bancos.ShowModal;
  If frm_treeAtiv.dir_canc  then
          exit;
  try
    If frm_Tabenga <> nil then
       frm_Tabenga := tfrm_Tabenga.create(self);



    frm_treeAtiv.Mostra_tabelas( frm_treeAtiv.IdbAdo,'',frm_TabEnga,frm_TabEnga.srcList,false);

  finally
    If frm_Tabenga <> nil then
     frm_Tabenga.Close;
    If frm_bancos <> nil then
     frm_bancos.close;
  end;

end;

procedure Tfrm_tabenga.CancelBtnClick(Sender: TObject);
begin
 // inherited;
 frm_treeAtiv.dir_canc := true;
 close;
end;

function Tfrm_tabenga.Pesq_provider(pProvider : string) : boolean  ;
var
iProv : Tprov;
 Begin
   result := false;
   try
     
     iProv := Tprov.Create(self);
    // iProv.Connection := frm_treeativ.idbAdo;
     iProv.PROVIDER_NAME := pProvider;
     If iProv.Get_provider then
      result := true;
   finally
     freeandnil(iProv);
   end;

 end;

procedure Tfrm_tabenga.Cria_provider(pProvider:string; adc : TADOConnection)   ;
var
iProv : Tprov;

 Begin
   try
     
     iProv := Tprov.Create(self);
     //iProv.Connection := frm_treeativ.idbado;
     iProv.Connection := adc;
     iProv.PROVIDER_NAME := pProvider;
     iProv.Excluir;
     //frm_treeativ.iDbAdo.OpenSchema(siProviderTypes,emptyParam,emptyParam,adod);
     ADC.OpenSchema(siProviderTypes,emptyParam,emptyParam,adod);
     with adod do
      Begin
        while not eof do
         Begin
           iProv.TYPE_NAME     := adod.fieldbyname('TYPE_NAME').asstring;
           iProv.DATA_TYPE     := adod.fieldbyname('DATA_TYPE').asinteger;
           iProv.COLUMN_SIZE   := adod.fieldbyname('COLUMN_SIZE').asinteger;
           If not iProv.Incluir then
             Raise exception.create(Mens83);
           next;
         end;
      end;
   finally
     freeandnil(iProv);
   end;

 end;

function Tfrm_tabenga.RetDataTYpe (pProvider : string;pType : integer) : string;
var
iProv : Tprov;
 Begin
   result := ' ';
   try
     iProv := Tprov.Create(self);
    // iProv.Connection := frm_treeativ.idbado;
     iProv.PROVIDER_NAME := pProvider;
     iProv.DATA_TYPE     := pType;
     If iProv.Get_Type  then
      result := iProv.TYPE_NAME;
   finally
      freeandnil(iProv);
   end;

 end;



procedure Tfrm_tabenga.OKBtnClick(Sender: TObject);
var
i ,j,wtab,wAtr,wfalta,wcod,pospk :integer;
itab : Tdados_tab;
iNode : afNode;
iTotRow,iDelta,iCont : integer;
iLeft,iTop,iWidth,iheight : real;
iList : tstrings;
Filtro : OLEVariant;
wtipo ,wtam,wIndexant: string;
wPk,wordinal : TStringList;
begin
  inherited;

   wpk :=  TStringList.create;
   wordinal :=  TStringList.create;
  frm_treeAtiv.dir_canc := false;
  Filtro := VarArrayCreate([0,2],VarVariant);
  If not Pesq_Provider(frm_treeativ.idbAdo.Provider) then
     Cria_provider(frm_treeativ.idbAdo.Provider,frm_treeativ.idbAdo);
  iLeft  := 5;
  iTop   := 5;
  iDelta := 10;
  iCont := 0;
  try
  If itab = nil then
     iTab := Tdados_tab.create(self);
  iList := TstringList.Create;
  //pg_tab.Max := dstList.Items.Count;
  wtab := 0;
  wfalta := dstlist.items.Count;
  for i := 0 to dstList.Items.Count -1 do
   Begin
        dstList.Selected[i] := true;
        dstList.Repaint;

        iNode := tv.diagrama.Nodes.add(iLeft,iTop,0,0) ;
        tv.Diagrama.Atributos(iNode,1,'DMI');
        iNode.Text := dstList.Items[i];

        wpk.Clear;
        wordinal.Clear;
         { pega _Indexes}
        adod.Filter := 'TABLE_NAME = '+''''+iNode.Text+'''';
        adod.Filtered := true;
        frm_treeativ.idbAdo.OpenSchema(siIndexes,emptyparam,EmptyParam,adod);
        adod.First;

        wIndexAnt := '';
        while not adod.Eof do
         Begin
          If adod.FieldByName('INDEX_NAME').AsString <> wIndexant then
           Begin
               memo1.lines.add(' ') ;
               wIndexAnt := adod.fieldbyname('INDEX_NAME').AsString ;
               memo1.lines.add(wIndexAnt) ;
           end;
           memo1.lines.add('    '+adod.fieldbyname('COLUMN_NAME').AsString);
          adod.Next;
         end;

        itab.Cria_Inst(TV.Diagrama.EMPRESA,TV.Diagrama.CENARIO,TV.Diagrama.IDG,'IDF_IF','IF','S',iNode.text,memo1.text);
        iNode.Userdata := iTab.IDF_CODIGO;
        iLeft := iLeft + iNode.width +50;
        inc(iCont);
         If iCont >= idelta then
            Begin
             iCont := 0;
             iTop := iTop + iNode.height+50;
             iLeft:= 5;
            end;
        iList.Clear;
        wpk.Clear;
        wordinal.Clear;
         { pega _Primary key}
        adod.Filter := 'TABLE_NAME = '+''''+iNode.Text+'''';
        adod.Filtered := true;
        frm_treeativ.idbAdo.OpenSchema(siPrimaryKeys,emptyparam,EmptyParam,adod);
        adod.First;
        while not adod.Eof do
         Begin
          If adod.FieldByName('TABLE_NAME').AsString = iNode.text then
           Begin
              wpk.Add(adod.fieldbyname('COLUMN_NAME').AsString);
              wordinal.Add(adod.fieldbyname('ORDINAL').AsString);
           end;
         
          adod.Next;
         end;

        adod.Filter := '';
        Filtro[2] := iNode.text;
        frm_treeativ.idbAdo.OpenSchema(siColumns,Filtro,EmptyParam,adod);
        wAtr := 0;

        while not adod.Eof do
         Begin
            wTipo := RetDataType(frm_treeativ.idbAdo.Provider,adod.fieldbyname('DATA_TYPE').asinteger);
            wTam :=  adod.fieldbyname('CHARACTER_MAXIMUM_LENGTH').asstring;
            If wtam = '' then
             wtam := ' ';
            itab.Cria_InstDE(TV.Diagrama.EMPRESA,TV.Diagrama.CENARIO,TV.Diagrama.IDG,'IDF_DE','DE','N',
                             adod.fieldbyname('COLUMN_NAME').asstring,wTipo,wtam);

            inc(watr);
            //pg_atrib.Position := watr;
            //pg_atrib.Repaint;

            { inclui na tabela IDF_DADOS}
            try
              with Tdados_tab.Create(self) do
              Begin

                      wCod := iTab.IDF_CODIGO;
                       Begin
                         with Tdad.Create(self) do
                          Begin
                            CLI_ID := TV.Diagrama.EMPRESA;
                            PRJ_ID := TV.Diagrama.CENARIO;
                            IDF_CODIGO := wCod;
                            IDF_TABELA := iNode.Text;
                            IDF_DESIGNACAO :=  adod.fieldbyname('COLUMN_NAME').asstring;
                            IDF_DESCRICAO := ' ';
                            IDF_DATA_TYPE := wtipo;
                            IDF_DEFAULT_VALUE := '';
                            IDF_DOMINIO := '';
                            IDF_NAMING_PREFIX :='';
                            IDF_TYPE_QUALIFIERS := wtam;
                            IDF_PK := 0;
                            pospk := Inlista(IDF_DESIGNACAO,WPK) ;
                            If PosPk >= 0 then
                               IDF_PK := strtoint(wordinal[PosPk]);
                            IDF_CAPTION := ''   ;
                            IDF_OBRIG := '';
                            Incluidad ;
                            memo1.Text := ' ';
                            free;
                          end;
                       // Next;
                       end;
                  free;
              end;
            finally
            end;
            adod.Next;
         end;
        inc(wtab);
        wfalta := wfalta - 1;
        edit3.caption := inttostr(wfalta);
        edit3.repaint;
        //pg_tab.Position := wtab;
        //pg_tab.Repaint
    end ;
   finally
      freeandnil(itab);
      freeandnil(iList);
      dstlist.Clear;
      //pg_tab.Position := 0;
      //pg_atrib.Position := 0;
      edit3.caption := '';
      label1.caption := '';
   end;


end;

procedure Tfrm_tabenga.DstListDblClick(Sender: TObject);
begin
  inherited;
  ExcludeBtnClick(self);
end;

procedure Tfrm_tabenga.IncludeBtnClick(Sender: TObject);
begin
  inherited;
   edit3.caption := inttostr(dstlist.Items.Count);
end;

procedure Tfrm_tabenga.IncAllBtnClick(Sender: TObject);
begin
  inherited;
   edit3.caption := inttostr(dstlist.Items.Count);
end;

procedure Tfrm_tabenga.ExcludeBtnClick(Sender: TObject);
begin
  inherited;
   edit3.caption := inttostr(dstlist.Items.Count);
end;

procedure Tfrm_tabenga.ExcAllBtnClick(Sender: TObject);
begin
  inherited;
   edit3.caption := inttostr(dstlist.Items.Count);
end;

procedure Tfrm_tabenga.LoadConstants;
begin
  
      Caption               := defe21;//'Engenharia reversa - Tabelas' ;
      SrcLabel.Caption      := deft12;//'Tabelas Disponíveis'  ;
      DstLabel.Caption      := deft13;//'Tabelas a Importar' ;
     // sp1. Caption          := 'Novo banco de Dados' ;
     // Label1.Caption := 'Faltando .'  ;
      SpeedButton1.Caption  := defi4;//'Importar' ;
      SpeedButton2.Caption  := defc32;//'Cancel' ;
      gb.Caption            := def88 ;//'Banco de Dados'  ;
      Label2.Caption        := def10005;//'Nome .' ;
      Label3.Caption        := defl3;//'Localização .'  ;

  
end;

procedure Tfrm_tabenga.FormShow(Sender: TObject);
begin

  Ling(frm_main.Idioma,self);
  loadConstants;

  
end;



end.
