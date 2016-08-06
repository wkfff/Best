unit bst_escliImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, StdCtrls, ComCtrls, BstDB, cls_obj, cls_bd;

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
  Tfrm_esccliImport = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    tv: TTreeView;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure tvDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FEMPRESA: INTEGER;
    FCENARIO: Integer;
    FEMP: Tempresa;
    FBD: tBD;
    procedure SetCENARIO(const Value: Integer);
    procedure SetEMPRESA(const Value: INTEGER);
    procedure SetEMP(const Value: Tempresa);
    procedure SetBD(const Value: tBD);
    { Private declarations }
  public
    { Public declarations }
  published
   property EMPRESA  : INTEGER read FEMPRESA write SetEMPRESA;
   property CENARIO : Integer read FCENARIO write SetCENARIO;
   property EMP : Tempresa read FEMP write SetEMP;
   property BD : tBD read FBD write SetBD;
  end;


var
  frm_esccliImport: Tfrm_esccliImport;
  mDado : udado; 
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_esccliImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frm_esccliImport := nil;
   action := cafree;
end;

procedure Tfrm_esccliImport.DBGrid2DblClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_esccliImport.tvDblClick(Sender: TObject);
begin
   If tv.Selected.level <> 1 then
   begin
     showmessage(mens91);
     exit;
   end;
        Emp.cenarios.Open_Cenario(udado(Tv.selected.Data)^.FCli,udado(Tv.selected.Data)^.FProj);

        frm_main.lb_cli.caption :=  udado(Tv.selected.parent.Data)^.FNome;
        frm_main.lb_cen.caption :=  udado(Tv.selected.Data)^.FNome;
        frm_main.Canc_cli := false;
        close;
end;

procedure Tfrm_esccliImport.SpeedButton2Click(Sender: TObject);
begin
  frm_main.Canc_cli := true;
  //freeandnil(Emp);
  close;
end;


procedure Tfrm_esccliImport.SetCENARIO(const Value: Integer);
begin
  FCENARIO := Value;
end;

procedure Tfrm_esccliImport.SetEMPRESA(const Value: INTEGER);
begin
  FEMPRESA := Value;
end;

procedure Tfrm_esccliImport.SetEMP(const Value: Tempresa);
begin
  FEMP := Value;
end;

procedure Tfrm_esccliImport.SetBD(const Value: tBD);
begin
  FBD := Value;
end;

procedure Tfrm_esccliImport.FormShow(Sender: TObject);
var
wNode,WProj : TTreeNode;
begin
try
      emp.Connection := bd;
      emp.cenarios.Connection := bd;
      with Tv  do
       begin

         Emp.Open_All;
         Emp.First;
         while not Emp.Eof do
           begin
             new(mDado);
             mdado^.Fcli           := Emp.fieldbyname('CLI_ID').asinteger;
             mdado^.FProj          := 0;
             mdado^.fdiag          := 0;
             mdado^.FNome          := Emp.fieldbyname('CLI_NOME').asstring ;
             mdado^.FDiagid        := '';
             mdado^.FClasse        := '';
             WNode := items.addchildObject(nil,Emp.fieldbyname('CLI_NOME').asstring,mdado);
             Emp.cenarios.Open_Cenarios(mdado^.Fcli) ;
             with Emp.cenarios do
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
            Emp.next;

           end;
           FullExpand;
       end;

    finally
      // freeandNil(Emp);
    end;
end;

procedure Tfrm_esccliImport.FormCreate(Sender: TObject);
begin
   Emp := TEmpresa.create(self);
  
end;

end.
