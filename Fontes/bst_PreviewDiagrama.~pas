unit bst_PreviewDiagrama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, PRNFLOWLib_TLB, ComCtrls, ToolWin, ImgList;

type
  Tfrm_DiagramaPreview = class(TForm)
    PrnFlow1: TPrnFlow;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DiagramaPreview: Tfrm_DiagramaPreview;

implementation

uses bst_main, bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_DiagramaPreview.ToolButton1Click(Sender: TObject);
begin
PrnFlow1.NextPage;
end;

procedure Tfrm_DiagramaPreview.ToolButton4Click(Sender: TObject);
begin
  PrnFlow1.Zoom := 100;
end;

procedure Tfrm_DiagramaPreview.ToolButton3Click(Sender: TObject);
begin
  PrnFlow1.Zoom := 0;
end;

procedure Tfrm_DiagramaPreview.ToolButton2Click(Sender: TObject);
begin
//	PrnFlow1.hWndFlow := TV.Diagrama.hWnd;   //frm.AddFlow1.hWnd
  PrnFlow1.Preview := false;
	PrnFlow1.PrinterSettings := True;
	PrnFlow1.PrintDoc;
  frm_DiagramaPreview.Close;
end;

procedure Tfrm_DiagramaPreview.FormShow(Sender: TObject);
begin
  //PrnFlow1.Width := frm_DiagramaPreview.Width - 10;
end;

procedure Tfrm_DiagramaPreview.ToolButton5Click(Sender: TObject);
begin
  frm_DiagramaPreview.Close;
End;
end.
