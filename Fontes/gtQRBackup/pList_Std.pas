unit pList_Std;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pList = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pList: Tfrm_pList;

implementation



{$R *.dfm}

procedure Tfrm_pList.FormClose(Sender: TObject; var Action: TCloseAction);

begin
 frm_plist := nil;
 action := caFree;
end;

end.
