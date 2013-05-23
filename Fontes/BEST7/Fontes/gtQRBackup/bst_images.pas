unit bst_images;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, gtQrCtrls, jpeg;

type
  Tfrm_images = class(TForm)
    im2: TImage;
    im2_AND: TImage;
    IM54: TImage;
    im8: TImage;
    im15: TImage;
    im_ap: TImage;
    IM53: TImage;
    im55: TImage;
    ProgramIcon: TImage;
    Image1: TImage;
    im15_2: TImage;
    im99: TImage;
    im8_2: TImage;
    im54_2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_images: Tfrm_images;

implementation

{$R *.dfm}

procedure Tfrm_images.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_Images := nil;
  action := caFree;
end;

end.
