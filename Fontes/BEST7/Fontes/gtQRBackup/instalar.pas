unit instalar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Animate, GIFCtrl, TPCProgressBars;

type
  TForm3 = class(TForm)
    pg: TPCProgressBar;
    rg1: TRxGIFAnimator;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
  RG1.Animate := true;
end;

end.
