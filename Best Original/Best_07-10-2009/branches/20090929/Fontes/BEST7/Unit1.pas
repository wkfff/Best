unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, BSTDB, ADODB, Grids, DBGrids, StdCtrls, DBCtrls, ImgList,
  ComCtrls, ToolWin, Mask, Buttons;

type
  Tfrm_deView = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    tabGeral: TTabSheet;
    DBGrid1: TDBGrid;
    db_descricao: TDBMemo;
    db_dominio: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    tabGerenciamento: TTabSheet;
    gb: TGroupBox;
    lb5: TLabel;
    lb4: TLabel;
    lb6: TLabel;
    dtp_data: TDateTimePicker;
    db_data: TDBEdit;
    db_versao: TDBEdit;
    db_resp: TDBEdit;
    docext: TSpeedButton;
    DBEdit12: TDBEdit;
    OD: TOpenDialog;
    procedure CarregaItem(IDF_CODIGO :integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure dtp_dataCloseUp(Sender: TObject);
    procedure docextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_deView: Tfrm_deView;

implementation

uses bst_main, fonctions;

{$R *.dfm}

procedure Tfrm_deView.CarregaItem(IDF_CODIGO :integer);
Begin
  ADOQuery1.ConnectionString := bdx.ConnectionString;
  ADOQuery1.Parameters.Items[0].Value := IDF_CODIGO;
  ADOQuery1.Active := true;
End;


procedure Tfrm_deView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Close;
end;

procedure Tfrm_deView.ToolButton1Click(Sender: TObject);
begin
  ADOQuery1.DataSource.DataSet.Insert;
end;

procedure Tfrm_deView.ToolButton2Click(Sender: TObject);
begin
ADOQuery1.DataSource.DataSet.Post;
end;

procedure Tfrm_deView.ToolButton3Click(Sender: TObject);
begin
  frm_deView.Close;
end;

procedure Tfrm_deView.dtp_dataCloseUp(Sender: TObject);
begin
  DataSource1.dataset.edit;
  db_data.field.text := formatdatetime('dd/mm/yyyy',dtp_data.date);
end;

procedure Tfrm_deView.docextClick(Sender: TObject);
begin
  If frm_main.ULT_DIR <> '' then
   od.InitialDir := frm_main.ULT_DIR
  else
   od.InitialDir := getcurrentdir; 
  If dbedit12.text = '' then
   Begin
    If OD.execute then
     Begin
       dbedit12.DataSource.DataSet.edit;
       dbedit12.field.text := od.filename;
     end;

   end
  else
   Begin
     ExecProg(dbedit12.text,'');

   end;
  If dbedit12.Text <> '' then
    begin
      frm_main.ult_dir := extractFileDir(dbedit12.Text);

    end;
end;

end.
