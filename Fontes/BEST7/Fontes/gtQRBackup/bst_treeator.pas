unit bst_treeator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ComCtrls, Buttons, StdCtrls, Menus, ImgList, ExtCtrls,bstdb, gtQrCtrls,bst_basefrm;

type
  Tfrm_treeator = class(TBaseFrm)
    st: TImageList;
    pop: TPopupMenu;
    Expandir2: TMenuItem;
    Encolher2: TMenuItem;
    Exportar2: TMenuItem;
    im: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    Abrir1: TMenuItem;
    tv: TTreeView;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Mostra_tree;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);  //procuar o sub_id
    procedure popPopup(Sender: TObject);  //procuar o sub_id
    procedure Abrir2Click(Sender: TObject);
    procedure tvClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FExportdir: string;
    procedure SetExportdir(const Value: string);
    { Private declarations }
  public
    { Public declarations }
  property Exportdir : string read FExportdir write SetExportdir;
  procedure LoadConstantObj;override;
  end;

type
  udado = ^Tdado;
  Tdado = record
     fCli    : integer;
     fProj   : integer;
     FAtor   : integer;
     fAtiv   : integer;
     fPessoa : integer;
     fMecan  : integer
end;

var
  frm_treeator: Tfrm_treeator;
  I,Wwidg,x : INTEGER;
  Ind,WNodeAtual,IndTop,IndCli,IndAtiv : TtreeNode;
  Cli_ant : integer;
  mdado : Udado;
  iator : TAtor;
  iAp : TDados_Tab;
  iPs : Tps;
implementation

uses bst_ca, bst_ap, bst_main, bst_se, bst_dir1;



{$R *.DFM}

procedure Tfrm_treeator.LoadConstantObj;
begin
   inherited;
end;                                                      

procedure Tfrm_treeator.SpeedButton1Click(Sender: TObject);
begin
   TV.FullExpand;
end;

procedure Tfrm_treeator.Mostra_tree;      //mostra as atividades do projeto
var
   Wdesc : string;
   WWidg,i,Wpai : integer;
begin
    x    := -1;
    Ind := tv.TopItem;
    Cli_ant := 0;
    Wwidg       := 0;
    tv.ShowHint := false ;
    tv.items.clear;
    tv.readOnly := true;
    try
      iAtor := TAtor.create(self);
      iAtor.CLI_ID := CurrEmpresa.cenarios.CLI_ID;
      iAtor.PRJ_ID := CurrEmpresa.cenarios.PRJ_ID;
      iAtor.OpenAllbydesc(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,'IDF_ca','','');
      while not iAtor.eof do
        Begin
         New(mDado);
         mDado^.fcli  := iAtor.FieldByName('cli_id').asinteger;
         mDado^.fproj := iAtor.FieldByName('prj_id').asinteger;
         mDado^.fAtor := iAtor.FieldByName('idf_codigo').asinteger;

         ind := TV.Items.AddObject(NIL,iator.fieldbyname('idf_designacao').asstring,mDado);
         Indtop := Ind;

         indtop.SelectedIndex := 1;
         indtop.ImageIndex := 1;
         iAtor.next;
       end;
        Tv.FullCollapse;
      
    finally
       freeandnil(iAtor);
    end;

end;


procedure Tfrm_treeator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_treeator := nil;
  action := caFree;
end;

procedure Tfrm_treeator.TVDblClick(Sender: TObject);
var
itab : Tdados_Tab;
begin
   If tv.selected <> nil then
    begin
    iTab := Tdados_tab.create(self) ;
    try
       If tv.selected.Level = 0 then
        begin
          If frm_ca   = nil then
              frm_ca := tfrm_ca.Create(self);

          If not itab.Open_Objeto(CurrEmpresa.cenarios.CLI_ID, CurrEmpresa.cenarios.PRJ_ID
                             ,udado(tv.selected.Data)^.fAtor,'IDF_CA') then
                 raise exception.Create(EI1);
          
             frm_ca.Tipo        := 'CA';
             frm_ca.Visivel     := 'N';
             frm_ca.Mode        := 'M';
             frm_ca.AutoFecha   := false;
             frm_ca.idatasource := iTab.DataExt;
             frm_ca.Left        := tv.Width;
             frm_ca.showModal;

       end
     else
      If tv.selected.Level = 1 then      //atividades
      begin
      If  Checa_Acesso(uppercase('frm_ap'),frm_main.SEGHABILIATADO,0) then
      begin
       If not itab.Open_Objeto(CurrEmpresa.cenarios.CLI_ID, CurrEmpresa.cenarios.PRJ_ID
                             ,udado(tv.selected.Data)^.faTIV,'IDF_AP') then
                  raise exception.Create(EI1);

             If frm_ap = nil then
                frm_ap := Tfrm_ap.create(self);

             with frm_ap do
              begin
                Tabsheet6.TabVisible := false;
                Tabsheet8.TabVisible := false;
                Tipo        := 'AP';
                Visivel     := 'S';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := itab.DataExt;
                //frm_ap.pgcp.ActivePage := Tabsheet2;
               // frm_ap.pgcpChange(nil);
                showmodal;
              end;
       end;
      end
      else
      If tv.selected.Level = 2 then
      begin
       If not itab.Open_Objeto(CurrEmpresa.cenarios.CLI_ID, CurrEmpresa.cenarios.PRJ_ID
                             ,udado(tv.selected.Data)^.FmECAN,'IDF_SE') then
                  raise exception.Create(EI1);

             If frm_se = nil then
                frm_se := Tfrm_se.create(self);

             with frm_se do
              begin
               // Tabsheet6.TabVisible := false;
               // Tabsheet8.TabVisible := false;
                Tipo        := 'SE';
                Visivel     := 'S';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := itab.DataExt;
                showmodal;
              end;

      end;


    finally
      freeandnil(itab);
    end;
   end;
end;

procedure Tfrm_treeator.FormResize(Sender: TObject);
begin
 // frm_main.docadg;
end;



procedure Tfrm_treeator.SpeedButton2Click(Sender: TObject);
begin
  tv.FullCollapse;
end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end;

procedure Tfrm_treeator.SpeedButton3Click(Sender: TObject);
var
wnodeAtu : TTreeNode;
ExDir : string;
begin
WNodeAtu := tv.Selected;
GetDir(@(ExDir));
If ExDir <> '' then
 begin
       If ExtractFileExt(ExDir) <> '.txt' then
        ExDir := ExDir+'.txt' ;
       tv.SaveTofile(Exdir);
       showmessage(mens43+ExDir);
 end;
{If frm_diretorio = nil then
     frm_diretorio := Tfrm_diretorio.create(SELF);
  frm_diretorio.caption := def83;
  FRM_DIRetorio.SHOWMODAL;
  If exportdir <> '' then
     begin
       tv.SaveTofile(ExportDir+'.txt');
       showmessage(mens43+ExportDir+'.txt');
     end;  }
  tv.selected := wnodeatu;
  TvClick(self);   

end;

procedure Tfrm_treeator.Abrir1Click(Sender: TObject);
var
Wcod : Integer;
begin

end;

procedure Tfrm_treeator.Abrir2Click(Sender: TObject);
var
Wcod : Integer;
begin

end;


procedure Tfrm_treeAtor.popPopup(Sender: TObject);
var
popIt1,PopIt2,PopIt3 ,PopIt4,PopIt5,PopIt6,PopIt7,PopIt8 : TmenuItem;
begin
    Pop.items.Clear;

    begin
      Popit4 := TmenuItem.create(self);
      Popit4.caption := def97;
      Popit4.onClick := TVDblClick;
      Pop.Items.add (popit4);

      Popit5 := TmenuItem.create(self);
      Popit5.caption := '-';
      Popit5.onClick :=  SpeedButton1Click;
      Pop.Items.add (popit5);


      Popit1 := TmenuItem.create(self);
      Popit1.caption := def81;
      Popit1.onClick :=  SpeedButton1Click;
      Pop.Items.add (popit1);

      Popit2 := TmenuItem.create(self);
      Popit2.caption := def82;
      Popit2.onClick :=  SpeedButton2Click;
      Pop.Items.add (popit2);

      Popit3 := TmenuItem.create(self);
      Popit3.caption := def98;
      Popit3.onClick :=  SpeedButton3Click;
      Pop.Items.add (popit3);

      Popit7 := TmenuItem.create(self);
      Popit7.caption := '-';
      Pop.Items.add (popit7);

     { Popit8 := TmenuItem.create(self);
      Popit8.caption := 'Imprimir';
      Popit8.onClick :=  Imprimir1Click;
      Pop.Items.add (popit8); }

   end;
end;

procedure Tfrm_treeator.tvClick(Sender: TObject);
var
iAp : Tdados_tab;
iPs : Tdados_tab;
IndAt : TTreeNode;
itab : Tdados_tab;
 begin

 If tv.selected.HasChildren then
        exit;
   If tv.selected.Level = 0 then
    begin
      try
      If tv.selected.HasChildren then
        exit;
      iAp := TDados_tab.create(self);
      with iap do
      begin
       iAp.Get_PaisCorrelatos(udado(tv.selected.Data)^.FCli, udado(tv.selected.Data)^.FProj,
                              'AP',udado(tv.selected.Data)^.FAtor,'CA','IDF_AP','CLI_ID,PRJ_ID,IDF_WBS_CODE') ;
       while not eof do
       begin
        New(mDado);
        mDado^.fcli  := iAp.FieldByName('cli_id').asinteger;
        mDado^.fproj := iAp.FieldByName('prj_id').asinteger;
        mDado^.fAtiv := iAp.FieldByName('idf_codigo').asinteger;
        IndAt := TV.Items.AddChildObject(tv.selected,iap.fieldbyname('idf_designacao').asstring,mDado);
        If  iap.FieldByName('idf_tipo_ativ').asstring = 'UC' then
         begin
           indAt.SelectedIndex := 4;
           indAt.ImageIndex    := 3;
         end
        else
         begin
           indAt.SelectedIndex := 2;
           indAt.ImageIndex    := 2;
         end ;
        
        iAp.next;
       end;
     end;
   finally
    freeandnil(iAp);
    end;
    end
  else
       If tv.selected.Level = 1 then
        begin
          try
         ips := TDados_tab.create(self);
         with iPS do
          begin
           ips.Get_Correlatos(udado(tv.selected.Data)^.FCli, udado(tv.selected.Data)^.FProj,
                                  'AP',udado(tv.selected.Data)^.FAtiv,'SE','IDF_SE') ;
           while not eof do
           begin
            New(mDado);
            mDado^.fcli  := ips.FieldByName('cli_id').asinteger;
            mDado^.fproj := ips.FieldByName('prj_id').asinteger;
            mDado^.fmecan := ips.FieldByName('idf_codigo').asinteger;
            IndAt := TV.Items.AddChildObject(tv.selected,ips.fieldbyname('idf_designacao').asstring,mDado);
            indAt.SelectedIndex := 5;
            indAt.ImageIndex    := 5;
            ips.next;
           end;
         end;
       finally
        freeandnil(ips);
        end;
    end ;
    tv.Selected.Expand(true);

 end;



procedure Tfrm_treeator.FormShow(Sender: TObject);
begin
   inherited;
   Mostra_Tree;
end;

procedure Tfrm_treeator.SetExportdir(const Value: string);
begin
  FExportdir := Value;
end;

end.
