unit bst_pativ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  std_prel, QuickRpt, Qrctrls, ExtCtrls,  jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF,cls_obj,AddFlow5Lib_TLB,fonctions,gtQRRtns,bstdb,
  gtQRXport_Hub;

type
  Tfrm_pativ = class(Tfrm_pvertstd)
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    qr_main: TQRBand;
    QRDBText11: TgtQRDBText;
    QRLabel6: TgtQRLabel;
    QRDBText13: TgtQRDBText;
    ChildBand1: TQRChildBand;
    qrdbtext2: TgtQRDBRichText;
    qrdbtext12: TgtQRDBRichText;
    QR_METR: TQRChildBand;
    ChildBand2: TQRChildBand;
    qr_ator: TQRSubDetail;
    gtQRLabel10: TgtQRLabel;
    gtQRDBText10: TgtQRDBText;
    qr_func: TQRSubDetail;
    gtQRDBText9: TgtQRDBText;
    gtQRLabel11: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRDBRichText3: TgtQRDBRichText;
    qr_evento: TQRSubDetail;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    qr_regra: TQRSubDetail;
    gtQRDBText13: TgtQRDBText;
    gtQRLabel13: TgtQRLabel;
    qr_local: TQRSubDetail;
    gtQRDBText14: TgtQRDBText;
    gtQRLabel14: TgtQRLabel;
    plinkin: TgtQRMemo;
    gtQRLabel15: TgtQRLabel;
    pLinkOut: TgtQRMemo;
    QR_ti: TQRSubDetail;
    gtQRLabel17: TgtQRLabel;
    gtQRDBText15: TgtQRDBText;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    patorativ: TgtQRLabel;
    gtQRLabel16: TgtQRLabel;
    paplic: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRDBRichText1: TgtQRDBRichText;
    gtQRLabel5: TgtQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_atorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qr_eventoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_regraBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_localBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

    procedure qr_funcBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QR_tiBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FiAtor: TDados_tab;
    FiAp: TAp;
    FiRn: TDados_tab;
    FiLocal: TDados_tab;
    FiEn: TDados_tab;
    FiFunc: Tdados_tab;
    FiReq: TReq;
    procedure SetiAp(const Value: TAp);
    procedure SetiAtor(const Value: TDados_tab);
    procedure SetiEn(const Value: TDados_tab);
    procedure SetiLocal(const Value: TDados_tab);
    procedure SetiRn(const Value: TDados_tab);
    procedure SetiFunc(const Value: Tdados_tab);
    procedure SetiReq(const Value: TReq);
    { Private declarations }
  public
    { Public declarations }
  published
  property iAtor : Tdados_Tab  read FiAtor write SetiAtor;
  property iLocal : Tdados_Tab read FiLocal write SetiLocal;
  property iRn  : Tdados_Tab  read FiRn write SetiRn;
  property iEn : Tdados_Tab read FiEn write SetiEn;
  property iAp : TAp read FiAp write SetiAp;
  property iFunc : Tdados_tab read FiFunc write SetiFunc;
  property iReq : TReq read FiReq write SetiReq;


  end;

  type
  uLst = ^TLst;
  TLst = record
    dstNode : afNode;
    lnk     : afLink;
    tipo    : char;
end;

var
  frm_pativ: Tfrm_pativ;
  pca,plf,prn,pse,prm,pti : boolean;
  mLst : uLst;
implementation

uses bst_main;

{$R *.DFM}

procedure Tfrm_pativ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FRM_PATIV := NIL;
  ACTION := CAFREE;
end;

procedure Tfrm_pativ.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //qrlabel3.caption := '('+ trim(dm6.qry_patividf_tipo_ativ.value)+')';
end;

procedure Tfrm_pativ.qr_atorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If pca then
    begin
      gtQRLabel10.caption := def10 ;
      pca := false;
    end
  else
    gtQRLabel10.caption:= '';

  If qr_ator.DataSet.FieldByName('ATOR_CATEGORIA').asstring = 'Responsável' then
   pAtorativ.Caption := def45
  else
  If qr_ator.DataSet.FieldByName('ATOR_CATEGORIA').asstring = 'Participante' then
   pAtorativ.Caption := def46
  else
   pAtorativ.Caption := def47  ;
end;

procedure Tfrm_pativ.FormCreate(Sender: TObject);
begin
  inherited;
  pca := true;
  prn := true;
  plf := true;
  pse := true;
  prm := true;
  pti := true;
  iAtor := TDados_tab.create(self);
  iRn := TDados_tab.create(self);
  iEn := TDados_tab.create(self);
  iFunc := TDados_tab.create(self);
  iReq:= Treq.create(self) ;
  iLocal := TDados_tab.create(self);
  iAp := Tap.create(self);


  QRLabel6. Caption   := def39;//'Descrição/Description .' ;
  gtQRLabel2.Caption  := def1270;//'Valor Agregado / Added value'  ;
  gtQRLabel3.Caption  := defp6;//'ProtótipoTela/Screen Prototype' ;
  qrLabel6.Caption    := def39;//'Descrição/Description'  ;
  gtqrLabel4.Caption  := def39;//'Descrição/Description'  ;
  gtQRLabel15.Caption := def9000;//'Fluxos de Entrada/Input Data Groups' ;
  gtQRLabel16.Caption := def900;//'Fluxos de Saida/Output Data Groups' ;
  gtQRLabel10.Caption := def10;//'Atores/Actors .'   ;
  gtQRLabel11.Caption := deft5 ;//'Tecnologia/Technology' ;
  gtQRLabel12.Caption := def321;//'Aplicativo/Software .'  ;
  gtQRLabel1.Caption  := def2;//'Eventos de Negócio/Business Events'  ;
  gtQRLabel13.Caption := def5;//'Regras de Negócio/Business Rules'  ;
  gtQRLabel14.Caption := def48;//'Local/Site .'   ;
  gtQRLabel17.Caption := def37;//'Alternativos/Alternatives' ;



end;

procedure Tfrm_pativ.qr_eventoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If qr_evento.DataSet.fieldbyname('IDF_DESIGNACAO').asstring = '' then
     qr_evento.Height := 0
  else
     qr_evento.Height := 19;
  If prm then
    begin
      gtQRLabel1.caption := def2 ;
      prm := false;
    end
  else
    gtQRLabel1.caption := '';
end;

procedure Tfrm_pativ.qr_regraBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If qr_regra.DataSet.fieldbyname('IDF_DESIGNACAO').asstring = '' then
     qr_regra.Height := 0
  else
     qr_regra.Height := 19;
  If prn then
    begin
      gtQRLabel13.caption := def5 ;
      prn := false;
    end
  else
    gtQRLabel13.caption := '';
end;

procedure Tfrm_pativ.qr_localBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If plf then
    begin
      gtQRLabel14.caption := def48 ;
      plf := false;
    end
  else
    gtQRLabel14.caption := '';
end;

procedure Tfrm_pativ.ChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  pca := true;
  prn := true;
  plf := true;
  pse := true;
  prm := true;
  pti := true;
  //qrlabel11.Font.Style := [fsBold,fsUnderline]   ;
end;

procedure Tfrm_pativ.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //showmessage(qrp.DataSet.DataSource.Name);
  {If qrp.DataSet.fieldbyname('IDF_TIPO_ATIV').asstring = 'AP' then
   CHILDBAND1.Height := 0
  ELSE
   CHILDBAND1.Height := 68;
 // qrlabel11.Font.Style := [fsBold,fsUnderline]   ;}
end;


procedure Tfrm_pativ.qr_funcBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {If qrp.DataSet.fieldbyname('IDF_TIPO_ATIV').asstring = 'AP' then
   qr_func.Height := 0
  else
   begin
     qr_func.Height := 57;
     with Tdados_tab.create(self) do
      begin
       Open_objeto(qrp.DataSet.fieldbyname('CLI_ID').asinteger,
                   qrp.DataSet.fieldbyname('PRJ_ID').asinteger,
                   qr_func.DataSet.fieldbyname('IDF_COD_APLIC').asinteger,'IDF_TX' );
       pAplic.Caption := fieldbyname('IDF_DESIGNACAO').asstring;
       free;
      end;
   end;
   }

  If pse then
    begin
      gtQRLabel11.caption := def49 ;
      pse := false;
    end
  else
    gtQRLabel11.caption := '';
end;

procedure Tfrm_pativ.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
oNode : afNode;
i : integer;
mLst : uLst;
oList : TList;
dgx : TAddFlow;
begin
  inherited;
  pLinkIn.Lines.Clear;
  pLinkOut.Lines.Clear;
  try
     dgx := TAddFlow.create(self);
   //  with Tdg.Create do
     Begin
       {oNode := Localiza_fisico(qrp.dataset.fieldbyname('CLI_ID').asinteger,
                             qrp.dataset.fieldbyname('PRJ_ID').asinteger,
                             qrp.dataset.fieldbyname('IDF_CODIGO').asinteger,
                             qrp.dataset.fieldbyname('IDG_ID').asinteger,
                             'AP','DPN',dgx);
       If oNode <> nil then
        Begin
           oList := Get_links(oNode,' ');
           for i := 0 to oList.Count-1 do
            Begin
              mLst := oList.Items[i];
              If mLst^.tipo = 'I' then
                Begin
                 If InList(mLst^.lnk.Text,pLinkin) then
                    continue;
                 pLinkIn.Lines.Add(mLst^.lnk.Text)
                end

              else
              If mLst^.tipo = 'O' then
                Begin
                 If InList(mLst^.lnk.Text,pLinkOut) then
                    continue;
                 pLinkOut .Lines.Add(mLst^.lnk.Text) ;
                end;

            end;
        end; }
   end;
  finally
    dgx.free;
  end;


end;

procedure Tfrm_pativ.QR_tiBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  {If qrp.DataSet.fieldbyname('IDF_TIPO_ATIV').asstring = 'AP' then
   qr_ti.Height := 0
  else
   begin
    If qr_ti.DataSet.fieldbyname('TI_REQ_AP').asstring = '' then
     qr_ti.Height := 0
    else
     qr_ti.Height := 39;

   end;
  If pti then
    begin
      gtQRLabel17.caption := def37 ;
      pti := false;
    end
  else
    gtQRLabel17.caption:= '';}
end;

procedure Tfrm_pativ.SetiAp(const Value: Tap);
begin
  FiAp := Value;
end;

procedure Tfrm_pativ.SetiAtor(const Value: TDados_tab);
begin
  FiAtor := Value;
end;

procedure Tfrm_pativ.SetiEn(const Value: TDados_tab);
begin
  FiEn := Value;
end;

procedure Tfrm_pativ.SetiLocal(const Value: TDados_tab);
begin
  FiLocal := Value;
end;

procedure Tfrm_pativ.SetiRn(const Value: TDados_tab);
begin
  FiRn := Value;
end;

procedure Tfrm_pativ.SetiFunc(const Value: Tdados_tab);
begin
  FiFunc := Value;
end;

procedure Tfrm_pativ.SetiReq(const Value: Treq);
begin
  FiReq := Value;
end;

end.
