unit BST_help;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls, gtQrCtrls;

type
  Tfrm_help = class(TForm)
    wb: TWebBrowser;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_help: Tfrm_help;

implementation



{$R *.DFM}

procedure Tfrm_help.FormCreate(Sender: TObject);
var
a,b,c,d: olevariant;
Whelp,Wcurdir : string;
Wpos,Wlen : integer;
begin
 // WCurDir := trim(ExtractFileDir(paramstr(0)));
 // Wlen := length(WCurDir);
 //    WCurdir := WCurdir + '\';

 // Whelp := Wdir + 'Menu_Principal_Quadro_entrada.htm';
  Whelp := ExtractFilePath(Application.ExeName) + 'HELP_BEST.mht';
  wb.navigate(whelp,a,b,c,d);
end;

procedure Tfrm_help.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_help := nil;
  action := cafree;
end;

procedure Tfrm_help.Button2Click(Sender: TObject);
begin
  WB.GoForward;
end;

procedure Tfrm_help.Button1Click(Sender: TObject);
begin
  WB.goback;
end;

procedure Tfrm_help.SpeedButton2Click(Sender: TObject);
begin
  wb.goback;
end;

procedure Tfrm_help.SpeedButton1Click(Sender: TObject);
begin
   wb.goforward;
end;

end.
