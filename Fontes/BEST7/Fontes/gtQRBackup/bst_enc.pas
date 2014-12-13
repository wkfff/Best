unit bst_enc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,bstdb, gtQrCtrls;

type
  Tfrm_enc = class(TForm)
    dbg: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_enc: Tfrm_enc;
  iAlias : Tbanco;
implementation

{$R *.dfm}

procedure Tfrm_enc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 freeandnil(iAlias);
 frm_enc := nil;
 action := caFree;
end;

procedure Tfrm_enc.FormCreate(Sender: TObject);
begin
   iAlias := TBanco.create(self);
   iAlias.openall;
   dbg.DataSource := iAlias.DataExt;
end;

end.
