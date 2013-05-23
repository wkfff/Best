unit bst_pac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, QuickRpt, Qrctrls, ExtCtrls,  StdCtrls, jpeg,cls_utils,bstdb, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pac = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRSubDetail1: TQRSubDetail;
    pdim: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    qrg1: TQRChildBand;
    QRLabel4: TgtQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRDBText11: TgtQRDBText;
    QRDBText12: TgtQRDBText;
    QRLabel11: TgtQRLabel;
    QRDBText13: TgtQRDBText;
    QRLabel12: TgtQRLabel;
    QRDBText14: TgtQRDBText;
    QRLabel13: TgtQRLabel;
    QRDBText15: TgtQRDBText;
    pcausa: TgtQRDBRichText;
    QRDBRichText2: TgtQRDBRichText;
    QRDBRichText4: TgtQRDBRichText;
    QRDBRichText1: TgtQRDBRichText;
    l_oper: TgtQRLabel;
    QRMemo1: TgtQRMemo;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    QRG2: TQRChildBand;
    qrlabel3: TgtQRLabel;
    qrlabel14: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    qrlabel10: TgtQRLabel;
    gtQRDBRichText1: TgtQRDBRichText;
    gtQRDBRichText2: TgtQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrg1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FiAp: Tdados_tab;
    procedure SetiAp(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iAp : Tdados_tab read FiAp write SetiAp;
  end;

var
  frm_pac: Tfrm_pac;
  pps : Boolean;

implementation

uses bst_treeAtiv, bst_Escaspect, bst_main;

{$R *.DFM}

procedure Tfrm_pac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // freeandnil(iAp);  
   frm_pac := nil;
   action := cafree;
end;

procedure Tfrm_pac.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 mtab ,mTipo: string;
begin
  inherited;
     qrmemo1.Lines.Clear;
     //mTipo :=  qrp.dataset.fieldbyname('IDF_TIPO_ATIV').asstring  ;
     If mTipo <> '' then
      begin
        mTab := 'IDF_'+mTipo;
       //
        {iAp.Get_Correlatos(qrp.dataset.fieldbyname('CLI_ID').asinteger,
                        qrp.dataset.fieldbyname('PRJ_ID').asinteger,'AC',
                        qrp.dataset.fieldbyname('IDF_CODIGO').asinteger,
                        mTipo,mTab);}
               
        while not iap.eof do
         begin
          qrmemo1.Lines.add(iap.fieldbyname('IDF_DESIGNACAO').asstring );
          iap.next;
         end;
      end;
    If pps then
      begin
       //pdim.caption :=qrp.DataSet.fieldbyname('IDF_NATUREZA').asstring+def38 ;
       pps := false;
      end
    else
     pdim.caption := '';
end;

procedure Tfrm_pac.FormCreate(Sender: TObject);
begin
  inherited;
  pps := true;
  iAp := TDados_tab.create(self);
  qrSubdetail1.DataSet := iAp;
  qrDataSet(qrSubdetail1,iAp);

  /////
   QRLabel5.Caption   := Mensasp1;//'Causa  '   ;    
   QRLabel7.Caption   := defe6;//'Entrevistados ' ;
   QRLabel4. Caption  := Mensasp2;//'Efeito  '   ;
   QRLabel3.Caption   := defa7;//'Ação Corretiva  '  ;
   QRLabel10.Caption  := defe7;//'Envolvidos ' ;
   QRLabel14.Caption  := defp7;//'Prazo para Conclusão '  ;
   QRLabel11.Caption  := defd11;//'Dimensão' ;
   QRLabel12.Caption  := defn1;//'Norma  '  ;
   QRLabel13.Caption  := 'No ' ;
   gtQRLabel1.Caption := defp4;//'Ponto de Vista '  ;
   Caption            := def61;//'Atividades Afetadas' ;
   QRLabel6.Caption   := Mensasp3;//'Expectativas de ganho'  ;
   qrlabel6.Font      := qrlabel5.Font;  

end;

procedure Tfrm_pac.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 iOper : TDiag_dados;
begin
  inherited;
  pps := true;
  iOper := TDiag_dados.create(self);

  {l_oper.caption := iOper.Get_desc(qrp.dataset.fieldbyname('CLI_ID').asinteger,
                                   qrp.dataset.fieldbyname('PRJ_ID').asinteger ,
                                   qrp.dataset.fieldbyname('IDF_ID').asinteger) ;
  l_oper.left := ((ph1.width div 2) - l_oper.width div 2) ; }

 // pr_cli.left := ((ph1.width div 2) - pr_cli.width div 2) ;

  //pr_proj.left := ((ph1.width div 2) - pr_proj.width div 2) ;
  //titulo.caption      := qrp.dataset.fieldbyname('IDF_TIPO__ASPECTO').ASSTRING;
  //titulo.caption      := 'Aspectos Críticos';
  //titulo.left := ((ph1.width div 2) - titulo.width div 2) ;
  //subtitulo.caption   := qrp.dataset.fieldbyname('IDF_DESIGNACAO').asstring;
  //subtitulo.left := ((ph1.width div 2) - subtitulo.width div 2) ;
  {If qrp.dataset.fieldbyname('IDF_TIPO__ASPECTO').ASSTRING = 'AC'  then
      begin
        frm_pac.qrg1.visible := true;
        frm_pac.qrg2.visible := true;
      end
   else
      begin
        qrlabel5.caption := def39;
        qrg1.height := 0;

        qrg2.height := 0;
       // ChildBand1.height := 0;
    end ;}
  If frm_Treeativ <> nil then
  Begin

  end;
end;

procedure Tfrm_pac.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
 mTipo,mtab : string;
begin
  inherited;
  //showmessage(pcausa.DataField);  

end;

procedure Tfrm_pac.SetiAp(const Value: Tdados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_pac.qrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
  mtab,mTipo : string;
begin
  inherited;
  
end;

procedure Tfrm_pac.qrg1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //showmessage(QRDBRichText2.DataField);
  //QRDBRichText2.DataSet := qrp.dataset;
end;

end.
