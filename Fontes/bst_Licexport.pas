unit bst_Licexport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ImgList, ComCtrls, ToolWin, StdCtrls;

type
  Tfrm_LicExport = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RichEdit1: TRichEdit;
    ToolbarImages: TImageList;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_LicExport: Tfrm_LicExport;

implementation

uses bst_main;



{$R *.dfm}

procedure Tfrm_LicExport.SpeedButton1Click(Sender: TObject);
begin
  //frm_main.SS2.SafeTrans;
end;

procedure Tfrm_LicExport.SpeedButton2Click(Sender: TObject);
begin
 // frm_main.SS2.SafeImport;
end;

procedure Tfrm_LicExport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_licexport := nil;
  action := cafree;
end;

end.
