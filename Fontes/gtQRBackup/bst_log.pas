unit bst_log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,cls_obj,cls_bd,bstdb, gtQrCtrls,
  TPCProgressBars,bst_Basefrm, ImgList, ComCtrls, ToolWin;

type
  Tfrm_log = class(TBasefrm)
    Memo1: TMemo;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sd: TSaveDialog;
    //pg: TPCProgressBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadConstantObj;override ;
    { Public declarations }
  end;

var
  frm_log: Tfrm_log;

implementation

uses bst_exdir, bst_main, bst_treeAtiv, bst_dir1;

{$R *.dfm}

procedure Tfrm_log.LoadConstantObj;
begin
 inherited  ;
 caption                   := 'SQL';//      andamento
 speedbutton1.caption       := def903;//      salvar
 speedbutton2.caption      := defc32;//      cancelar
end;

procedure Tfrm_log.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frm_log := nil;
   action := cafree;
end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end;

procedure Tfrm_log.SpeedButton1Click(Sender: TObject);
var
 ExDir : string;
begin
GetDir(@(ExDir));
If ExDir <> '' then
 begin
       If ExtractFileExt(ExDir) <> '.sql' then
        ExDir := ExDir+'.sql' ;
       memo1.lines.SaveTofile(Exdir);
       //showmessage(mens43+ExDir);
 end;
 
 close;
end;




procedure Tfrm_log.SpeedButton2Click(Sender: TObject);
begin
 frm_treeativ.dir_canc := true;
 close;
end;

procedure Tfrm_log.ToolButton3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
