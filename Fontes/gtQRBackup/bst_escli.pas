unit bst_escli;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, StdCtrls, ComCtrls,BstDB,cls_obj, gtQrCtrls;

  type
  uDado = ^Tdado;
  Tdado = record
     Fcli       : integer;
     FProj      : integer;
     FDiag      : integer;
     FNome      : string;
     FDiagId    : string;
     fClasse    : string;
  end;

type
  Tfrm_esccli = class(TBaseFRm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    tv: TTreeView;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;


var
  frm_esccli: Tfrm_esccli;
  mDado : udado; 
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_esccli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frm_esccli := nil;
  action := cafree;
end;

procedure Tfrm_esccli.DBGrid2DblClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_esccli.FormCreate(Sender: TObject);
var
wNode,WProj : TTreeNode;
begin
 try
      with Tv  do
       begin
         If CurrEmpresa = nil then
            CurrEmpresa := TEmpresa.create(self);
         CurrEmpresa.Open_All;
         CurrEmpresa.First;
         while not CurrEmpresa.Eof do
           begin
             new(mDado);
             mdado^.Fcli           := CurrEmpresa.fieldbyname('CLI_ID').asinteger;
             mdado^.FProj          := 0;
             mdado^.fdiag          := 0;
             mdado^.FNome          := CurrEmpresa.fieldbyname('CLI_NOME').asstring ;
             mdado^.FDiagid        := '';
             mdado^.FClasse        := '';
             WNode := items.addchildObject(nil,Currempresa.fieldbyname('CLI_NOME').asstring,mdado);
             CurrEmpresa.cenarios.Open_Cenarios(mdado^.Fcli) ;
             with CurrEmpresa.cenarios do
               begin
                 while not Eof do
                  begin
                    new(mDado);
                    mdado^.Fcli     := fieldbyname('CLI_ID').asinteger;
                    mdado^.FProj    := fieldbyname('PRJ_ID').asinteger;
                    mdado^.fdiag    := 0;
                    mdado^.FNome    := fieldbyname('PRJ_TITULO').asstring;
                    mdado^.FDiagid  := '';
                    mdado^.FClasse  := '';
                    WProj           := items.addchildObject(WNode,fieldbyname('PRJ_TITULO').asstring,mDADO);
                    next;
                  end;
                end;
            CurrEmpresa.next;

           end;
           FullExpand;
       end;

    finally
      // freeandNil(Currempresa);
    end;

end;


procedure Tfrm_esccli.tvDblClick(Sender: TObject);
begin
   If tv.Selected.level <> 1 then
   begin
     showmessage(mens91);
     exit;
   end;
        CurrEmpresa.cenarios.Open_Cenario(udado(Tv.selected.Data)^.FCli,udado(Tv.selected.Data)^.FProj);
        frm_main.lb_cli.caption :=  udado(Tv.selected.parent.Data)^.FNome;
        frm_main.lb_cen.caption :=  udado(Tv.selected.Data)^.FNome;
        frm_main.Canc_cli := false;
       // SHOWMESSAGE(INTTOSTR(CURREMPRESA.cenarios.CLI_ID) + '  '+INTTOSTR(CURREMPRESA.cenarios.PRJ_ID));
        close;
end;

procedure Tfrm_esccli.SpeedButton2Click(Sender: TObject);
begin
  frm_main.Canc_cli := true;
  freeandnil(CurrEmpresa);
  frm_esccli.Close;
  //close;
  //application.Terminate;
end;


procedure Tfrm_esccli.Loadconstantobj;
var
i : integer;

begin
  inherited;
  Caption              := def65+' x '+def881 ;//'Clientes x Cenários'  ;
  SpeedButton1.Caption := defc31;//'Concluir'  ;
  SpeedButton2.Caption := defc32;//'Cancelar' ;

end;

end.

