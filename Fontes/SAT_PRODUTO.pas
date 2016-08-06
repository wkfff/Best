unit SAT_PRODUTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SAT_STD, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask, db, dbtables, 
  satDb, Grids, DBGrids;

type
  Tfrm_prod = class(Tstd)
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    cmb_grupo: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    cmb_fab: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_prod: Tfrm_prod;

implementation

{$R *.dfm}

procedure Tfrm_prod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_prod := nil;
  inherited;

end;

procedure Tfrm_prod.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   close;
end;

procedure Tfrm_prod.FormCreate(Sender: TObject);
 var
 iTab: Tproduto;
begin
  inherited;

   Itab := TProduto.create(self);
   iTab.Nivel         := 'F'; //produtos finais
   idatasource        := itab.DataExt;
   iTab.RequestLive   := true;

   itab.OpenAll;
   status             := 'M';
end;

procedure Tfrm_prod.FormShow(Sender: TObject);
VAR
iTipo,iModelo,iFab: Tdados_tab;
begin
  inherited;
   DbGrid1.DataSource := iDataSource;
   
   itipo := Tdados_tab.create(self);
   iTipo.Tabela := 'GRUPO';
   iTipo.OpenAll;
   cmb_grupo.ListSource := iTipo.DataExt;
   dbedit7.DataSource  := iTipo.DataExt;
   dbedit7.dataField   := 'DESCRICAO';


   iFab := Tdados_tab.create(self);
   iFab.Tabela := 'FABRICANTE';
   iFab.OpenAll;
   cmb_fab.ListSource  := iFab.DataExt;
   dbedit6.DataSource  := iFab.DataExt;
   dbedit6.dataField   := 'FANTASIA';
   caption := caption + ' - PRODUTOS';
end;

procedure Tfrm_prod.sp2Click(Sender: TObject);
begin
  idatasource.DataSet.edit;
  idatasource.DataSet.fieldbyname('NIVEL').value := 'C';
  inherited;

end;

end.
