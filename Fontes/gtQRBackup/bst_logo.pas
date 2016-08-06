unit bst_logo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, gtQrCtrls, Buttons,bst_basefrm;

type
  Tfrm_logo = class(TBasefrm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   procedure LoadConstantobj;override;
    { Public declarations }
  end;

var
  frm_logo: Tfrm_logo;
  hr : THandle;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_logo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_logo := nil;
  action := cafree;
end;


procedure Tfrm_logo.FormDeactivate(Sender: TObject);
begin
 close;
end;

procedure Tfrm_logo.LoadConstantObj;
begin
 inherited
end;

procedure Tfrm_logo.FormCreate(Sender: TObject);
begin
{If wdemo then
   caption := case_name +'('+ ' Versão Beta Demo' + frm_main.VER+')'
  else
   caption := case_name +'( '+' Versão Beta ' + frm_main.VER+')' ;
  REPAINT;  }
 
end;

procedure Tfrm_logo.FormShow(Sender: TObject);
begin
  inherited;
 // hr := createRoundRectRgn(50,50,600,400,400,500);//CreateEllipticRgn(0,0,400,200);

 //SetWindowRgn(Handle,hR,True);
end;

end.
