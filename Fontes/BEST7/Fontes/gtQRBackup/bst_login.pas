unit bst_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,frm_primar, jpeg, ExtCtrls;

type
  Tfrm_login = class(TPrimar)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    spb2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ProgramIcon: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

procedure Tfrm_login.SpeedButton1Click(Sender: TObject);
begin
 frm_login.height := spb2.top +50;
end;

procedure Tfrm_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frm_login :=nil;
 action := caFree;
end;

procedure Tfrm_login.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
