
unit bst_patorat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg, bstdb;

type
  Tfrm_patorat = class(Tfrm_pvertstd)
    db: TQRBand;
    gtQRDBRichText1: TQRDBRichText;
    db2: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    gtQRLabel2: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    ChildBand2: TQRChildBand;
    gtQRLabel5: TQRLabel;
    gtQRDBText1: TQRDBText;
    ppes: TQRMemo;
    gtQRLabel6: TQRLabel;
    patorativ: TQRLabel;
    gtQRDBText2: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure db2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
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
  frm_patorat: Tfrm_patorat;
  
implementation

uses bst_main;

{$R *.DFM}

procedure Tfrm_patorat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   
   frm_patorat := nil;
   action := caFree;
end;

procedure Tfrm_patorat.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  inherited;
 // iAp.Connection := bdx;
  {iAp.Get_PaisCorrelatos(qrp.DataSet.fieldbyname('CLI_ID').asinteger,
                         qrp.DataSet.fieldbyname('PRJ_ID').asinteger,
                         'AP',
                         qrp.DataSet.fieldbyname('IDF_CODIGO').asinteger,'CA','IDF_AP'); }
                           


end;

procedure Tfrm_patorat.SetiAp(const Value: Tdados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_patorat.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  ppes.Lines.Clear;
  with Tdados_tab.Create(self) do
   Begin
     //Get_Correlatos(qrp.dataset.fieldbyname('CLI_ID').asinteger,qrp.dataset.fieldbyname('PRJ_ID').asinteger,'CA',qrp.dataset.fieldbyname('IDF_CODIGO').asinteger,'PS','IDF_PS') ;
     while not eof do
      Begin
        ppes.Lines.Add(fieldbyname('IDF_DESIGNACAO').asstring);
        next;
      end;
      free;
   end;
end;

procedure Tfrm_patorat.db2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If db2.DataSet.FieldByName('ATOR_CATEGORIA').asstring = 'Responsável' then
   pAtorativ.Caption := def45
  else
  If db2.DataSet.FieldByName('ATOR_CATEGORIA').asstring = 'Participante' then
   pAtorativ.Caption := def46
  else
   pAtorativ.Caption := def47  ;
end;

procedure Tfrm_patorat.FormCreate(Sender: TObject);
begin
  inherited;
   ////
 //QRLabel1.Caption    := 'Data Versão '  ;
 //QRLabel8.Caption    := 'Responsável' ;
 //QRLabel9.Caption    := 'Versão'  ;
 //QRLabel2.Caption    := 'Aprovação'  ;
 gtQRLabel1.Caption  := uppercase(defm8);//'MISSÃO' ;
 gtQRLabel2.Caption  := uppercase(dim1);//'PROCESSOS'   ;
 gtQRLabel3.Caption  := def39;//'Descrição' ;
 gtQRLabel4.Caption  := def450 +'  '+lowercase(defo5)+'  '+def46  ;//'Responsável ou Participante' ;
 gtQRLabel5.Caption  := def105;//'Manual de Processos' ;
 GtQRLabel6. Caption := def450;//'Responsável '  ;

end;

end.
