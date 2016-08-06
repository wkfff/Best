unit bst_objetos;

interface                             
uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls,cls_obj,bstdb, StdCtrls, Buttons, ExtCtrls,
  Menus, cls_utils, fonctions;

type
  Tfrm_objetos = class(TBaseFRm)
    trv_objetos: TTreeView;
    lb: TListBox;
    Panel1: TPanel;
    sp1: TSpeedButton;
    gb: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lb_cpo: TListBox;
    pp1: TPopupMenu;
    Atributos1: TMenuItem;
    Label4: TLabel;
    pp2: TPopupMenu;
    MenuItem1: TMenuItem;
    DBGrid1: TDBGrid;
    Edit3: TEdit;
    Query1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure trv_objetosDblClick(Sender: TObject);
    procedure lbDblClick(Sender: TObject);
    procedure sp1Click(Sender: TObject);
    procedure Atributos1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure trv_objetosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lbEnter(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trv_objetosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Ffecha: boolean;
    procedure Setfecha(const Value: boolean);
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  published
   property fecha : boolean read Ffecha write Setfecha;
  end;

var
  frm_objetos: Tfrm_objetos;
   s : string;
implementation

uses bst_main, bst_bancos, bst_treeAtiv;

{$R *.DFM}

procedure Tfrm_objetos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   If fecha then
    Begin
      frm_objetos    := nil;
      action := caFree;
    end
   else
     action := caHide; 

end;

procedure Tfrm_objetos.DBGrid1DblClick(Sender: TObject);
begin

  { dm2.qry_oe.edit;
   dm2.qry_oe.fieldbyname('idf_designacao').asstring := dm9.qry_Objetos.fieldbyname('idf_designacao').value;
   dm2.qry_oe.fieldbyname('idf_nome').asstring       := dm9.qry_Objetos.fieldbyname('idf_designacao').value;
   dm2.qry_oe.fieldbyname('sub_id').asstring         := dm9.qry_Objetos.fieldbyname('idf_codigo').value;
   DM2.QRY_OE.post;
   If frm_dg <> nil then
      Begin
        If diag <> nil then
           Begin
              diag.SelectedNode.text := dm9.qry_Objetos.fieldbyname('idf_designacao').value;
              diag.SelectedNode.Tag := 'IF';
              diag.SelectedNode.UserData :=  dm9.qry_Objetos.fieldbyname('idf_codigo').asinteger;
           end;

      end; }

   close;
end;

procedure Tfrm_objetos.trv_objetosDblClick(Sender: TObject);
begin
  //Enviado Pelo Yves em 26/05/2009
   tv.diagrama.SelectedNode.text := trv_objetos.selected.text;
   if frm_treeativ.Origem_dados = 0 then
   Begin
    tv.diagrama.SelectedNode.Tag := 'OE';
   End
   Else
   Begin
    tv.diagrama.SelectedNode.Tag := 'IF';
   End;

   If trv_objetos.selected.data <> nil then
      tv.diagrama.SelectedNode.UserData :=  strtoint(uObj(trv_objetos.selected.data)^.fCodigo) ;
   fecha := false;
   CLOSE;


   {tv.diagrama.SelectedNode.text := trv_objetos.selected.text;
   tv.diagrama.SelectedNode.Tag := 'IF';
   //tv.diagrama.SelectedNode.UserData :=  strtoint(uObj(trv_objetos.selected.data)^.fCodigo); -- Comentado por ocorrer erro LCK
   fecha := false;
   CLOSE;}
end;

procedure Tfrm_objetos.Setfecha(const Value: boolean);
begin
  Ffecha := Value;
end;

procedure Tfrm_objetos.lbDblClick(Sender: TObject);
begin
   tv.diagrama.SelectedNode.text := lb.Items[lb.itemindex];
   fecha := false;
   CLOSE;
end;

procedure Tfrm_objetos.sp1Click(Sender: TObject);
begin
  If frm_bancos = nil then
   frm_bancos := tfrm_bancos.create(self);
  frm_bancos.ShowModal;
  try
    If frm_objetos = nil then
     frm_objetos := tfrm_objetos.create(self);
    frm_treeAtiv.Mostra_tabelas( frm_treeAtiv.IdbAdo,'',frm_objetos,frm_objetos.lb,false);

  finally
    If frm_objetos <> nil then
     frm_objetos.Close;
    If frm_bancos = nil then
     frm_bancos.close;
  end;

  
end;

procedure Tfrm_objetos.Atributos1Click(Sender: TObject);
begin
  s := pp1.Owner.Name;
  If frm_treeativ <> nil then
   Begin
    lb_cpo.BringToFront;
    frm_treeativ.idbado.GetFieldNames(lb.Items[lb.ItemIndex],lb_cpo.items);
   end;
end;

procedure Tfrm_objetos.MenuItem1Click(Sender: TObject);
var
i : integer;
begin

      If frm_Treeativ <> nil then
       Begin
        If tv.Diagrama.SelectedNode <> nil then
          begin

             If tv.Diagrama.SelectedNode.Tag = 'IF' then
               begin
                dbgrid1.BringToFront;
                 dbgrid1.Visible := true;
                 lb_cpo.Visible := false;
                 with Tdad.Create(self) do
                  Begin
                   CLI_ID :=  udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj ;
                   Get_dados(trv_objetos.Selected.text);
                   dbgrid1.DataSource := dataext;
                  end;

               end
            else
              begin
               If tv.Diagrama.SelectedNode.Tag = 'OE' then
                begin
                  dbgrid1.Visible := false;
                  lb_cpo.Visible := true;
                  lb_cpo.Left := dbgrid1.left;
                  lb_cpo.Top := dbgrid1.Top;
                  lb_cpo.Width := dbgrid1.Width;
                  lb_cpo.Height := dbgrid1.Height;
                  frm_TreeAtiv.idbado.GetFieldNames(trv_objetos.Selected.text,lb_cpo.Items);
                end;

              end;
            end;

        end;

  
end;

procedure Tfrm_objetos.trv_objetosClick(Sender: TObject);
begin
   dbgrid1.DataSource := nil;
  // edit3.Text := '';
 //  activeCOntrol := trv_objetos;
end;

procedure Tfrm_objetos.FormActivate(Sender: TObject);
var
 i : integer;
begin
  ActiveControl := trv_objetos;
  edit3.Text := '';
  If lb.Count > 0 then
    Begin
     for i := 0 to lb.count -1 do
       Begin
        trv_objetos.Items.add(nil,lb.items[i]);
       end;
    end;
end;

procedure Tfrm_objetos.lbEnter(Sender: TObject);
begin
 ActiveControl := edit3;
end;

procedure Tfrm_objetos.Edit3Change(Sender: TObject);
begin
 trv_objetos.selected := (locate_data(trv_objetos,edit3.Text) as TTreenode);
 activeControl := edit3;
end;

procedure Tfrm_objetos.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key=VK_ESCAPE) and (activeControl = edit3) then //escape
      begin
        edit3.text := '';
        ActiveControl := trv_objetos;
      end;
end;

procedure Tfrm_objetos.trv_objetosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key=VK_UP) OR(Key=VK_DOWN) then
    exit
  else
  If (Key=VK_ESCAPE)  then
      edit3.text := ''
  else
  If (activeControl = trv_objetos) then
      begin
           // activecontrol := edit3;
            edit3.text     := char(key);
            edit3.SelStart :=1;;
      end;
end;

procedure Tfrm_objetos. Loadconstantobj;
var
 i: integer;
begin

end;

end.

