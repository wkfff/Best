unit bst_stdcad;

interface

uses
  Windows, bst_BaseFrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  Tfrm_stdcad = class(TBasefrm)
    Panel1: TPanel;
    sp2: TSpeedButton;
    sp_novo: TSpeedButton;
    sp_del: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure sp_sairClick(Sender: TObject);

    procedure sp2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadCOnstantObj;override;
  end;

var
  frm_stdcad: Tfrm_stdcad;

implementation



{$R *.DFM}

procedure Tfrm_stdcad.sp_sairClick(Sender: TObject);
begin
 close;
end;




procedure Tfrm_stdcad.sp2Click(Sender: TObject);
begin
  sp2.enabled := false ;
end;

procedure Tfrm_stdcad.SpeedButton3Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_stdcad.LoadCOnstantObj;
var
i :integer;
begin
  inherited;

end;


end.
