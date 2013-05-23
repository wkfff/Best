unit bst_de;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, Mask, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls,
  ImgList, Buttons, ToolWin, ExtCtrls, Menus,db,bstdb, QuickRpt, Qrctrls,CLS_UTILS, gtQrCtrls,
  ActnList;

type
  Tfrm_de = class(Tfrm_obj)
    dbg: TDBGrid;
    Label2: TLabel;
    db_descricao: TDBMemo;
    Label3: TLabel;
    db_dominio: TDBMemo;
    dbg_de: TDBGrid;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_dgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sp_printClick(Sender: TObject);
    procedure dbg_deKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sp_insertClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    procedure DePost(Dataset: Tdataset);
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_de: Tfrm_de;

implementation

uses bst_main, bst_pde, bst_ExecutaQuery, bst_data;

{$R *.dfm}

procedure Tfrm_de.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frm_ExecutaQuery.ExecutaQuery(Cliente,Cenario,'DG', StrToInt(frm_data.DBEdit4.Text),'DE',StrToInt(DBEdit1.Text),' ', 0,0);
  frm_de  := nil;
  action := caFree;
end;

procedure Tfrm_de.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_de.FormShow(Sender: TObject);
begin
  inherited;
  tb_atv.TabVisible    := false;
  tb_dados.TabVisible  := false;
  TabSheet1.TabVisible := false;
  dbg_de.DataSource.DataSet.BeforePost := dePost;
 end;

procedure Tfrm_de.DePost(Dataset : Tdataset);
var
 iCodigo : integer;
 Customer : string;
 begin
   with Tdados_tab.create(self) do
      begin
         try
           Customer := IntToStr(cliente);
           CLI_ID := cliente;
           PRJ_ID := cenario;
           dbg_de.DataSource.DataSet.fieldbyname('CLI_ID').Value := cliente;
           dbg_de.DataSource.DataSet.fieldbyname('PRJ_ID').Value := cenario;
           iCodigo := get_MaxKey('IDF_DE')+1;
           dbg_de.DataSource.DataSet.fieldbyname('IDF_CODIGO').Value := iCodigo;
         finally
            free;
         end;
      end;
 end;

procedure Tfrm_de.dbg_dgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If (shift = ([ssCtrl])) and (key = VK_DELETE) then
     begin
     If MessageDlg(mens23,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     else
        raise exception.create(mens25);

     end;
end;

procedure Tfrm_de.sp_printClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  If frm_pDe = nil then
    frm_pDe := tfrm_pDe.create(self);

    try
      //frm_pDe.qrp.DataSet := iDataSource.DataSet;

     with frm_pDe do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_pDe.Components[i],idatasource.dataset);
          end;
      end;
      //frm_pDe.titulo.caption :=uppercase( def26);
      //frm_pDe.subtitulo.caption := dbedit6.text;
      //frm_pDe.qrp.preview;
      //FRM_pDe.CLOSE;
    finally

    end;

end;



procedure Tfrm_de.dbg_deKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   If (shift = ([ssCtrl])) and (key = VK_DELETE) then
     begin
     If MessageDlg(mens23,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     else
        raise exception.create(mens25);

     end;
end;

procedure Tfrm_de. Loadconstantobj;
var
i : integer;

begin
  Caption := def26;//'Características' ;
  Label2.Caption := def39;//'Descrição'  ;
  Label3.Caption := def55;//'Domínio'  ;
  //dbg_de.Columns[0].Title.caption := def10005;//'Nomes'      ;
  //dbg_de.Columns[1].Title.caption := def1210;// 'Tipo'      ;
  //dbg_de.Columns[2].Title.caption := def270;//'Tamanho'      ;
  //dbg_de.Columns[3].Title.caption := 'Default'      ;

end;

procedure Tfrm_de.sp_insertClick(Sender: TObject);
begin
  inherited;
  dbg_de.DataSource.DataSet.Insert;
end;

procedure Tfrm_de.FormDeactivate(Sender: TObject);
Var
variavel : Tdados_Tab;
begin
  inherited;
  //frm_de.Close;
  //variavel.ListaCodigo := StrToInt(DbEdit1.Text);
  //sLista1Click(Sender);
end;

end.

