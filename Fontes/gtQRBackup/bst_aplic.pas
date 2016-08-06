unit bst_aplic;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, Menus, ImgList, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, Buttons, ToolWin, Mask, ExtCtrls,bstdb, OleCtrls,fonctions,cls_utils,
  Qrctrls, QuickRpt, ActnList;

type
  Tfrm_aplic = class(Tfrm_obj)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet1: TTabSheet;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dtp: TDateTimePicker;
    TabSheet2: TTabSheet;
    trv_mec: TTreeView;
    DBEdit3: TDBRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dtpCloseUp(Sender: TObject);
    //procedure BitBtn1Click(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure trv_mecDblClick(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);

  private
    procedure Mostra_Sistemas;
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  published
   iAplic : Tdados_Tab;
  end;

var
  frm_aplic: Tfrm_aplic;

implementation

uses bst_main, bst_se, bst_pAplic;

{$R *.dfm}

procedure Tfrm_aplic.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
 Caption := def321;//'Aplicativos' ;
 Label1.Caption := def10005;//'Nome'  ;
 Label2.Caption := def1010;//'Objetivo' ;
 Label3.Caption := def800 ;//'Fornecedor' ;
 Label4.Caption := def88 ;//'Banco de dados Usado' ;
 TabSheet2.Caption := def112;//'Mecanismos'  ;
 TabSheet1.Caption := def11231;//'Métrica'  ;
 Label6. Caption := defc13;//'Custo Aquisição/Desenvolvimento' ;
 Label7.Caption  := defc14 ;//'Custo Anual de Manutenção'  ;
 Label8.Caption  := defo1;//'Outros Custos'  ;
 Label5.Caption  := defd5;//'Data Implantação' ;






end;

procedure Tfrm_aplic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_aplic := nil;
  action := cafree;
end;

procedure Tfrm_aplic.FormCreate(Sender: TObject);
begin
  inherited;
   dtp.Date := date;

end;

procedure Tfrm_aplic.dtpCloseUp(Sender: TObject);
begin
  inherited;
  dbedit4.DataSource.DataSet.Edit;
  dbedit4.Field.Text := datetostr(dtp.date);
end;

{procedure Tfrm_aplic.BitBtn1Click(Sender: TObject);
begin
  inherited;
  CLOSE;
end;}

procedure Tfrm_aplic.spb_delClick(Sender: TObject);
begin
  with TDados_tab.Create(self) do
   Begin
    If Get_Aplicativos(cliente,cenario,id)  > 0 then
     Begin
      free;
      Raise exception.create(Mens54);
     end;

    idatasource.DataSet.Delete;
    free;
   end;

end;

procedure Tfrm_aplic.Mostra_Sistemas;
VAR
WCAT : STRING;
Begin
 with Tdados_tab.create(self) do
   begin
      TRV_MEC.Items.Clear;
      Get_Mecanismos(Cliente,Cenario,ID) ;
       while not eof do
       Begin
        new(mObj);
        mObj^.Fcodigo := fieldbyname('IDF_CODIGO').asstring ;
        mObj^.fDesc   := fieldbyname('IDF_DESIGNACAO').asstring ;
       { mObj^.fnome    := fieldbyname('IDF_NOME').asstring ;
        wcat := FormataCampo(fieldbyname('IDF_NOME').asstring,'B',40,'R')+'  ';
        If trim(wcat) = '' then
         wcat := '';  }
        trv_MEC.Items.AddObject(nil,WCAT +fieldbyname('IDF_DESIGNACAO').asstring,mObj);

        next;
       end;
     // Cria_lista(trv_Mec,false,true);
   end;
end;

procedure Tfrm_aplic.pgcpChange(Sender: TObject);
begin
  inherited;
  If pgcp.ActivePage = Tabsheet2 then
   Mostra_sistemas;
end;

procedure Tfrm_aplic.trv_mecDblClick(Sender: TObject);
var
iTab : Tdados_tab;
begin
  inherited;
   begin
   If trv_MEC.Selected = nil then
      exit;
   iTab := Tdados_tab.create(self) ;
   with itab  do
   begin

   If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_mec.selected.Data)^.fcodigo),'IDF_SE') then
         raise exception.Create(EI1);
   end;
   If frm_SE   = nil then
      frm_SE := tfrm_SE.Create(self);
   with frm_SE do
    begin
       Tipo        := 'SE';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := iTab.DataExt;
       showmodal;
    end;


  end;
end;  

procedure Tfrm_aplic.sp_printClick(Sender: TObject);
var
 i : integer;
 iAp : TDados_tab;
begin
  inherited;
  If frm_pAplic = nil then
    frm_pAplic := tfrm_pAplic.create(self);

    try
     iaP := Tdados_tab.create(self);
     If not iaP.Get_Mecanismos(Cliente,cenario,Id) then
      Raise exception.create(Mens76) ;
    // frm_pAplic.qr_at.dataset := iAp;
     qrDataset(frm_pAplic.qr_at,iAp);

     //frm_pAplic.qrp.DataSet := iAp;
     //frm_paplic.subtitulo.Caption := dbedit1.Text;
     {with frm_pAplic do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_pAplic.Components[i],idatasource.dataset);
          end;
      end;  }
      //rm_pAplic.titulo.caption := def321;
      //frm_paplic.qrp.Preview;
      fRM_pAplic.CLOSE;
    finally

    end;    
end;



procedure Tfrm_aplic.sp2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

