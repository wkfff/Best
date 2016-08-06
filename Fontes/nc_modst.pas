unit nc_modst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids;

type
  Tfrm_modst = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type
  vdado = ^Tdado;
  Tdado = record
     FCodigo: string;

  end;
var
  frm_modst: Tfrm_modst;
  pdado : vdado;
implementation

uses nc_dm, nc_main, nc_mi;

{$R *.DFM}

procedure Tfrm_modst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frm_modst := nil;
 action := cafree;
end;

procedure Tfrm_modst.FormCreate(Sender: TObject);
begin
 dm.qry_mod.close;
 dm.qry_mod.RequestLive := false;
  dm.qry_mod.open;
end;

procedure Tfrm_modst.DBGrid1DblClick(Sender: TObject);
begin
  frm_main.Ins_Rec(dm.qry_mod.FieldbyName('codigo').value,
                   dm.qry_mi.fieldbyname('codigo').value,
                   'D','',0 ,frm_mi.tv.selected.level+1);
  new (mdado);
  mDado^.fCodigo  := dm.Qry_mod.fieldbyname('codigo').value;

 frm_mi.tv.Items.AddChildObject(frm_mi.tv.selected,dm.qry_mod.FieldbyName('codigo').value,mDado);

end;

procedure Tfrm_modst.DBGrid1TitleClick(Column: TColumn);
begin
  with dm.qry_mod do
  begin
    close;
    sql.clear;
    sql.add('select * from component  ');
    sql.add('where tipo = '+''''+'MO'+'''');
    sql.add(' order by '+ column.Fieldname);
    open;
  end;
end;

end.
