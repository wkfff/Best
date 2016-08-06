unit bst_preqtitot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,comctrls, jpeg,bstdb, cls_obj,
  dbTables, db, math;

type
  Tfrm_preqtitot = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    Ltree: TQRLabel;
    bd2: TQRChildBand;
    bd3: TQRChildBand;
    bd4: TQRChildBand;
    pTipo: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    pObjuc: TQRRichText;
    Regra: TQRRichText;
    pap: TQRRichText;
    ppg: TQRRichText;
    qrdesc: TQRRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrpNeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_preqtitot: Tfrm_preqtitot;
  pimp : Boolean;
  iUc : Tap;
  iTab,Ippg : TDados_tab;
  iTi : TReq;
  wseq ,wSubSeq: integer;
  iString : Tstrings;
implementation

uses bst_treeAtiv, bst_main, bst_dm_rel;



{$R *.DFM}

procedure Tfrm_preqtitot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  freeandnil(iuc);
  freeandnil(iTi);
  freeandnil(itab);
  freeandnil(ippg);
  freeandnil(istring);
  frm_preqtitot := nil;
  action := caFree;
end;

procedure Tfrm_preqtitot.qrpNeedData(Sender: TObject;
  var MoreData: Boolean);
var
i , Tot_filho,j,k,totlin,wmax: integer;
Wnode : TTreeNode;
Wnome,Wniv : string;
Wgrid : boolean;
pnode : TtreeNode;
Wtip1,wtip2 : string;
BlobStream : TBlobStream;

begin
  inherited;
  moredata := true;


  Pimp := false;
  frm_treeativ.Ti := frm_treeativ.Ti + 1;
  If frm_treeativ.Ti = tv.TreeList.count then
     moredata := false
  else
     begin
      try
          If iUc = nil then
            iUc := Tap.Create(self);


          dm_rel.qry_req.Insert;
          lTree.Caption := tv.TreeList[frm_TreeAtiv.Ti];
          dm_rel.qry_req.fieldbyname('PROCESSO').value :=  lTree.Caption;
          
          wsubseq := 0;
          inc(wseq);
          inc(wsubseq);
          dm_rel.qry_req.fieldbyname('SEQ').value :=  wseq;
          dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;

          iUc.Open_uc(strtoInt(tv.TreeCli[frm_treeAtiv.TI]),strtoInt(tv.TreeProj[frm_treeAtiv.TI]),
                               strtoInt(tv.Treecod[frm_treeAtiv.TI])) ;

          //descricao atividade
          frm_treeativ.dbrt.DataSource := iUc.DataExt;
          frm_treeativ.dbrt.DataField := 'IDF_DESCRICAO';

          If  frm_treeativ.dbrt.Text <> '' then
           begin
             qrdesc.Lines.Clear;
             qrDesc.Lines.add(frm_treeativ.dbrt.Text);
             dm_rel.qry_req.fieldbyname('DESC_PROCESSO').value :=  lTree.Caption;
           end;

         //objetivo use case
          frm_treeativ.dbrt.DataField := 'IDF_OBJETIVO_UC';

          If  frm_treeativ.dbrt.Text <> '' then
           begin
             pObjuc.Lines.Clear;
             pObjuc.Lines.add(frm_treeativ.dbrt.Text);

           end;


          If iUc.fieldbyname('IDF_TIPO_ATIV').value = 'AP' then
             pTipo.caption  := def63
          else
             pTipo.caption  := def64  ;

           If itab = nil then
              iTab := Tdados_tab.create(self);
           iTab.Get_Correlatos(strtoInt(tv.TreeCli[frm_treeAtiv.TI]),
                             strtoInt(tv.TreeProj[frm_treeAtiv.TI]),'AP',
                             strtoInt(tv.Treecod[frm_treeAtiv.TI]),'RN','IDF_RN' ) ;

           ippg := Tdados_tab.create(self);
           ippg.Get_Correlatos(strtoInt(tv.TreeCli[frm_treeAtiv.TI]),
                             strtoInt(tv.TreeProj[frm_treeAtiv.TI]),'AP',
                             strtoInt(tv.Treecod[frm_treeAtiv.TI]),'DG','IDF_DG' ) ;
           If iTi = nil then
              iTi := Treq.create(self)  ;
           iTi.CLIENTE := strtoInt(tv.TreeCli[frm_treeAtiv.TI]) ;
           iTi.CENARIO := strtoInt(tv.TreeProj[frm_treeAtiv.TI]) ;
           iTi.ID      := strtoInt(tv.Treecod[frm_treeAtiv.TI]) ;
           iTi.get_TI;

          pap.lines.clear;
          ppg.lines.clear;
          regra.lines.clear;
           iString.Clear;
         // requerimentos
         While not iti.eof do
           begin
             pimp := true;
             If iTi.FieldByName('ti_req_pg').value = '' then
               begin
                 bd4.height := 0;
               end
             else
             bd4.height := 48;
             pap.Lines.add(iTi.fieldbyname('ti_req_ap').asstring);
             iti.next;
           end;



           frm_treeativ.dbrt.DataField  := 'IDF_DESCRICAO';
           frm_treeativ.dbrt.DataSource := itab.DataExt;


           // Regras
           while not itab.eof do
           begin
             If  frm_treeativ.dbrt.Text <> '' then
             begin
               regra.Lines.Clear;
               Regra.Lines.add(frm_treeativ.dbrt.Text);
             end;
             iString.Add(itab.fieldbyname('IDF_DESIGNACAO').asstring);
             itab.next;
           end;

           //produtos
           PPG.Lines.Clear;
           while not iPPG.eof do
           begin
             PPG.Lines.add(ippg.fieldbyname('IDF_DESIGNACAO').asstring);
             dm_rel.qry_req.fieldbyname('PRODUTOS').value :=  ippg.fieldbyname('IDF_DESIGNACAO').asstring;
             ippg.next;
           end;

          wmax := pap.Lines.Count;
          wmax := max(wmax,regra.lines.count);
          wmax := max(wmax,ppg.Lines.count);

          for i := 0 to wmax - 1 do
           Begin
             If i > 0 then
              Begin
                inc(wsubseq);
                dm_rel.qry_req.Insert;
                dm_rel.qry_req.fieldbyname('SEQ').value    :=  wseq;
                dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;
              end;

             If i <= pap.lines.count - 1  then
                dm_rel.qry_req.fieldbyname('REQUERIMENTO').value := pap.lines[i];
             If i <= iString.Count - 1 then
                dm_rel.qry_req.fieldbyname('REGRA').value := iString[i];
             If i <= ppg.lines.count - 1 then
                dm_rel.qry_req.fieldbyname('PRODUTOs').value := ppg.lines[i];

           end;
           dm_rel.qry_req.post;
      finally

      end;

  end;

end;

procedure Tfrm_preqtitot.qrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
frm_treeAtiv.ti := 0;
 
end;

procedure Tfrm_preqtitot.FormCreate(Sender: TObject);
begin
  inherited;
  dm_rel.qry_req.open;
  iString := tstringList.create;
end;

end.

