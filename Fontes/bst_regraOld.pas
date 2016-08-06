unit bst_regraOld;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, ImgList,
  ComCtrls, ToolWin, Menus, bstdb, cls_obj, cls_utils;

type
  TFRM_REGRA = class(TForm)
    Label2: TLabel;
    Panel3: TPanel;
    sp2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    BitBtn1: TBitBtn;
    StandardToolBar: TToolBar;
    spb_copy: TSpeedButton;
    spb_Paste: TSpeedButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    BulletsButton: TToolButton;
    ToolButton1: TToolButton;
    ToolbarImages: TImageList;
    pgc: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    cmb1: TComboBox;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    sp_insert: TSpeedButton;
    sp_x: TSpeedButton;
    spb_del: TSpeedButton;
    Label1: TLabel;
    DBG1: TDBGrid;
    Label9: TLabel;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label30: TLabel;
    DBEdit21: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    dtp: TDateTimePicker;
    DBEdit2: TDBEdit;
    sp_Lista: TSpeedButton;
    SP_CRIA: TSpeedButton;
    SpeedButton13: TSpeedButton;
    DBGrid2: TDBGrid;
    Label12: TLabel;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    Label13: TLabel;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    salv: TSpeedButton;
    Dbmemo1: TDBRichEdit;
    Dbmemo2: TDBRichEdit;
    Dbmemo3: TDBRichEdit;
    sp_imp: TSpeedButton;
    sp_exp: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMBChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cmb1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mostra_Corr;
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBMemo1DblClick(Sender: TObject);
    procedure spb_copyClick(Sender: TObject);
    procedure spb_PasteClick(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Dbmemo2DblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure sp_xClick(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure sp_excClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure dtpClick(Sender: TObject);
    procedure procura_Regra(pCodigo : integer);
    procedure sp_ListaClick(Sender: TObject);
    procedure SP_CRIAClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure salvClick(Sender: TObject);
    procedure sp_expClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_REGRA: TFRM_REGRA;

implementation

uses bst_main;



{$R *.DFM}

procedure TFRM_REGRA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_regra := nil;
  action := cafree;
end;

procedure TFRM_REGRA.CMBChange(Sender: TObject);
begin
   If not viewer then
       //dm2.Qry_Rn.edit;
  
end;

procedure TFRM_REGRA.FormDeactivate(Sender: TObject);
begin
  
  
 // If WChangeRelationText then
  //   frm_dg.Atualiza_Relation;
  //wrelSelected.text :=dm7.qry_IdfCorr.FieldbyName('idf_designacao').asstring;
end;


procedure TFRM_REGRA.DBEdit5Change(Sender: TObject);
begin
  If not viewer then
 { Begin
    If dm2.Qry_Rn.active then
    begin
      dm2.Qry_Rn.edit;
      WChangeText   := true;
      sp2.enabled := true;
    end;
  end;  }


end;


procedure TFRM_REGRA.SpeedButton2Click(Sender: TObject);
begin
 { dm2.Qry_Rn.edit;
  dm2.Qry_Rn.Post;
  sp2.enabled := false;
  sp_insert.enabled := true;
  sp_x.enabled := false;
  If frm_dg <> nil then
     begin
      diag.SelectedNode.text := Dbedit5.Text;
       If WChangeText then
          Begin
            //frm_dg.Atualiza_Entity;
          end;
      close;
     end;}

end;

procedure TFRM_REGRA.cmb1Change(Sender: TObject);
begin
  {dm2.Qry_Rn.edit;
  Case Cmb1.ItemIndex of
    0 : Dbedit6.Field.Text := 'S';
    1 : Dbedit6.Field.Text := 'N';
  End; }
end;

procedure TFRM_REGRA.FormActivate(Sender: TObject);
begin
  If Dbedit6.Text = 'S' then
     Cmb1.ItemIndex := 0
  else
     Cmb1.ItemIndex := 1 ;
end;

procedure TFRM_REGRA.BitBtn1Click(Sender: TObject);
begin
 close;
end;


procedure TFRM_REGRA.Mostra_Corr;
Begin
 { with dm5.qry_DgDe1 do
      Begin
         close;
         parambyname('rcli').asinteger         := wCli;
         parambyname('rproj').asinteger        := wProj;
         parambyname('rtipo').asstring         := 'RN';
         If dbedit2.text = '' then
            parambyname('rpai').asinteger      := 0
         else
            parambyname('rpai').asinteger      := strtoint(Dbedit2.text);

         parambyname('rtipofilho').asstring    := 'DE';
         prepare;
         open;
      end; }

end;

procedure TFRM_REGRA.procura_Regra(pCodigo : integer);
begin
 { dm2.Qry_Rn.close;
  
  with dm2.Qry_Rn do
  Begin
     close;
     parambyname('rcli').asinteger       := Wcli;
     parambyname('rproj').asinteger      := Wproj;
     parambyname('rcodigo').asinteger    := pCodigo;
     prepare;
     open;
  end; }
end;

procedure TFRM_REGRA.FormCreate(Sender: TObject);
begin
 If viewer then
    Begin
      sp2.visible := false;
      sp_insert.visible := false;
      spb_del.visible := false;
      sp_X.visible := false;
       Dbgrid1.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit];
     // dm2.qry_rn.requestLive := false;
     // frm_main.Desabilita(self);
    end;

end;


procedure TFRM_REGRA.SpeedButton6Click(Sender: TObject);
begin
  {with dm6.qry_DelCorrAtiva do
   Begin
       close;
       parambyname('rcli').asinteger          := WCli;
       parambyname('rpaitipo').asstring       := 'RN';
       parambyname('rfilhotipo').asstring     := 'DE';
       parambyname('rfilhocodigo').asinteger  := dm5.Qry_DgDe1Idf_codigo.asinteger;
       parambyname('rpaicodigo').asinteger    := STRTOINT(dbedit2.text);
       close;
       execsql;
   end;
   Mostra_Corr; }
end;

procedure TFRM_REGRA.DBMemo1DblClick(Sender: TObject);
begin
   xpand(frm_regra,Tdbmemo(frm_regra.activeControl));
end;

procedure TFRM_REGRA.spb_copyClick(Sender: TObject);
begin
  xCopy(frm_regra);
end;

procedure TFRM_REGRA.spb_PasteClick(Sender: TObject);
begin
   xPaste(frm_regra);

end;

procedure TFRM_REGRA.BoldButtonClick(Sender: TObject);
begin
    xBold(frm_regra,BoldButton);

end;

procedure TFRM_REGRA.ItalicButtonClick(Sender: TObject);
begin
    xItalic(frm_regra,ItalicButton);

end;

procedure TFRM_REGRA.UnderlineButtonClick(Sender: TObject);
begin
     xUnderline(frm_regra,UnderlineButton);

end;

procedure TFRM_REGRA.LeftAlignClick(Sender: TObject);
begin
  //  frm_main.xAlign(frm_regra,Sender,dm2.Qry_Rn);

end;

procedure TFRM_REGRA.BulletsButtonClick(Sender: TObject);
begin
 //  frm_main.xBullet(frm_regra,BulletsButton,dm2.Qry_Rn);

end;

procedure TFRM_REGRA.ToolButton1Click(Sender: TObject);
begin
   //xFont(frm_regra);
end;

procedure TFRM_REGRA.Dbmemo2DblClick(Sender: TObject);
begin
   xpand(frm_regra,Tdbmemo(frm_regra.activeControl));
end;

procedure TFRM_REGRA.SpeedButton3Click(Sender: TObject);
begin
  
 { If frm_pregra = nil then
    frm_pregra := tfrm_pregra.create(self);
  If dbedit2.text <> '' then
    Begin
    with dm6.qry_rnat do
      Begin
         close;
         parambyname('rcli').asinteger    := Wcli;
         parambyname('rproj').asinteger   := WProj;
         parambyname('rcodigo').asinteger := strtoint(Dbedit2.text);
         prepare;
         open;
      end;
     with dm5.qry_DgDe2 do
      Begin
         close;
         dm5.qry_dgDe2.RequestLive := false;
         parambyname('rcli').asinteger          := wCli;
         parambyname('rproj').asinteger         := wProj;
         parambyname('rtipo').asstring          := 'RN';
         parambyname('rpai').asinteger          := strtoint(Dbedit2.text);
         parambyname('rtipofilho').asstring     := 'DE';
         prepare;
         open;
      end;
   end;
   frm_Pregra.titulo.caption     := 'REGRA DE NEGÓCIO';
   frm_Pregra.subtitulo.caption  := dbedit5.text;
   frm_Pregra.pr_cli.caption     := WCli_Nome;
   frm_Pregra.pr_proj.caption    := WPrj_titulo;
   frm_pregra.qRP.preview;
   frm_pregra.close;
   If not viewer then
      dm5.qry_dgDe2.RequestLive := true;; }
end;

procedure TFRM_REGRA.sp_insertClick(Sender: TObject);
var
Wcodigo : integer;
begin
  {WCodigo := frm_main.Cria_registro(1,'1',0,'RN','',WSubId);

    with dm2.Qry_Rn do
    Begin
       close;
       parambyname('rcli').asinteger       := Wcli;
       parambyname('rproj').asinteger      := Wproj;
       parambyname('rcodigo').asinteger    := WCodigo;
       prepare;
       open;
    end;
  sp2.enabled := true;
  sp_insert.enabled := false;
  sp_x.enabled := true; }
end;

procedure TFRM_REGRA.sp_xClick(Sender: TObject);
begin
  // dm2.Qry_Rn.Cancel;
   sp_Insert.enabled := true;
end;

procedure TFRM_REGRA.spb_delClick(Sender: TObject);
begin
   If MessageDlg('Confirma a eliminação desse Grupo de dados ?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
     // dm2.Qry_Rn.edit;
     // dm2.Qry_Rn.delete;
      sp2.enabled := false;
    end;
end;

procedure TFRM_REGRA.pgcChange(Sender: TObject);
begin
 { If pgc.ActivePage = tabsheet3 then //elementos de dados
  begin
    with dm5.qry_DgDe2 do
      Begin
         close;
          If viewer then
             Dbgrid2.Options  := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
         parambyname('rcli').asinteger          := wCli;
         parambyname('rproj').asinteger         := wProj;
         parambyname('rtipo').asstring          := 'RN';
         If dbedit2.text = '' then
            parambyname('rpai').asinteger       := 0
         else
            parambyname('rpai').asinteger       := strtoint(Dbedit2.text);

        parambyname('rtipofilho').asstring      := 'DE';
         prepare;
         open;
      end;
  end
  else
  If pgc.ActivePage = tabsheet2 then
  begin
    If dbedit2.text <> '' then
    Begin
    with dm6.qry_rnat do
      Begin
         close;
         parambyname('rcli').asinteger    := Wcli;
         parambyname('rproj').asinteger   := WProj;
         parambyname('rcodigo').asinteger := strtoint(Dbedit2.text);
         prepare;
         open;
      end;
    end;
  end
  else
  If pgc.ActivePage = tabsheet3 then
     Mostra_Corr;    }

end;

procedure TFRM_REGRA.sp_excClick(Sender: TObject);
begin
{  try
    begin
       //dm.db.StartTransaction;
       with dm4.qry_DelCorrLf do
       Begin
        close;
          parambyname('rcli').asinteger    := Wcli;
          parambyname('rproj').asinteger    := Wproj;
          parambyname('rpai').asinteger    := strtoint(Dbedit2.text);;
          parambyname('rFILHO').asinteger  := dm5.qry_DgDe1idf_codigo.asinteger;
          parambyname('rtipopai').asstring := 'RN';
          parambyname('rtipofilho').asstring := 'DE';
          prepare;
          execsql;
       end;
       //dm.db.commit;
       Mostra_Corr;

    end;
  except
    begin
       raise;
      // dm.db.rollback;
    end;
  end;}
end;

procedure TFRM_REGRA.SpeedButton9Click(Sender: TObject);
begin
 {  If frm_DE = nil then
      frm_de := Tfrm_de.Create(self);
  If ActiveControl = Dbg1 then
  begin

      with dm8.qry_pesqidde do
        Begin
          close;
          sql.clear;
          sql.add('SELECT * FROM IDF_DE ');
          sql.add('WHERE CLI_ID = '+''+inttostr(WCLI)+'');
          SQL.ADD(' AND PRJ_ID = '+''+inttostr(WPROJ)+'');
          sql.add(' AND IDF_TIPO_ATIVIDADE = '+''''+'DE'+'''');
          sql.add(' AND IDF_CODIGO = '+''+inttostr(dm5.qry_DgDe1idf_codigo.asinteger)+'');
          open;
        end;
  end;
  frm_de.showModal; }
end;

procedure TFRM_REGRA.DBMemo2Enter(Sender: TObject);
begin
  sp2.enabled := true;
end;

procedure TFRM_REGRA.dtpClick(Sender: TObject);
begin
  dbedit1.text := datetostr(dtp.date);
end;

procedure TFRM_REGRA.sp_ListaClick(Sender: TObject);
begin
  While true do
begin

end;
end;

procedure TFRM_REGRA.SP_CRIAClick(Sender: TObject);
var
  WCodigo : Integer;
begin

end;



procedure TFRM_REGRA.SpeedButton13Click(Sender: TObject);
begin
  sp_excClick(frm_regra) ;
end;


procedure TFRM_REGRA.Incluir1Click(Sender: TObject);
begin
  //dm5.qry_dgde2.Insert;
end;

procedure TFRM_REGRA.Excluir1Click(Sender: TObject);
begin
  {try
    begin
     If MessageDlg('Confirma a eliminação dessa Correlação?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       with dm4.qry_DelCorrLf do
       Begin
         close;
          parambyname('rcli').asinteger    := Wcli;
          parambyname('rproj').asinteger    := Wproj;
          parambyname('rpai').asinteger    := strtoint(Dbedit2.text);
          parambyname('rFILHO').asinteger  := dm5.qry_DgDe2.fieldbyname('idf_codigo').asinteger;
          parambyname('rtipopai').asstring := 'RN';
          parambyname('rtipofilho').asstring := 'DE';
          prepare;
          execsql;
       end;
       pgcChange(frm_regra);
       //dm.db.commit;
     end;
    end;
  except
    begin
       raise;
       //dm.db.rollback;
    end;
  end;}
end;

procedure TFRM_REGRA.salvClick(Sender: TObject);
begin
  //dm.db.ApplyUpdates([dm5.qry_dgde2]);
end;

procedure TFRM_REGRA.sp_expClick(Sender: TObject);
begin
 { WdirComp := '';
 If  frm_DirPad    =   nil then
     frm_DirPad     := Tfrm_DirPad .Create(self);
  frm_DirPad.showModal;

 If WdirComp <> '' then
     Dbmemo1.Lines.saveToFile(WdirComp);    }

end;

end.
