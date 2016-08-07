unit pd_tier;

interface
 uses
  windows,DB, ADODB,forms,Messages,Dialogs,basetier,data_tier,variants,
  stdctrls,classes,db_tier;

type


oEmpresa = class(TOObject)
  private

    FpDATA: real;
    FpE_MAIL: string;
    FpTELEF: string;
    FpPAIS: string;
    FpCEP: string;
    FpESTADO: string;
    FpSITE: string;
    FpCOMMENT: string;
    FpINSCR: string;
    FpCGC: string;
    FpFANTASIA: string;
    FpCARGO: string;
    FpTIPO: string;
    FpFAX: string;
    FpTELEF1: string;
    FpCIDAD: string;
    FpATIV: string;
    FpREGIAO: string;
    FpENDER: string;
    FpEMPRESA: string;
    

    procedure SetpATIV(const Value: string);
    procedure SetpCARGO(const Value: string);
    procedure SetpCEP(const Value: string);
    procedure SetpCGC(const Value: string);
    procedure SetpCIDAD(const Value: string);
    procedure SetpCOMMENT(const Value: string);
    procedure SetpDATA(const Value: real);
    procedure SetpE_MAIL(const Value: string);
    procedure SetpENDER(const Value: string);
    procedure SetpESTADO(const Value: string);
    procedure SetpFANTASIA(const Value: string);
    procedure SetpFAX(const Value: string);
    procedure SetpINSCR(const Value: string);
    procedure SetpPAIS(const Value: string);
    procedure SetpREGIAO(const Value: string);
    procedure SetpSITE(const Value: string);
    procedure SetpTELEF(const Value: string);
    procedure SetpTELEF1(const Value: string);
    procedure SetpTIPO(const Value: string);
    procedure SetpEmpresa(const Value: string);


 published
  property pFANTASIA                      : string read FpFANTASIA write SetpFANTASIA;
  property pEMPRESA                       : string  read FpEMPRESA write SetpEMPRESA;
  property pCGC                           : string read FpCGC write SetpCGC;
  property pINSCR                         : string  read FpINSCR write SetpINSCR;
  property pENDER                         : string read FpENDER write SetpENDER;
  property pESTADO                        : string read FpESTADO write SetpESTADO;
  property pCIDAD                         : string  read FpCIDAD write SetpCIDAD;
  property pCEP                           : string  read FpCEP write SetpCEP;
  property pPAIS                          : string  read FpPAIS write SetpPAIS;
  property pTELEF                         : string  read FpTELEF write SetpTELEF;
  property pTELEF1                        : string  read FpTELEF1 write SetpTELEF1;
  property pFAX                           : string  read FpFAX write SetpFAX;
  property pE_MAIL                        : string  read FpE_MAIL write SetpE_MAIL;
  property pATIV                          : string  read FpATIV write SetpATIV;
  property pCOMMENT                       : string  read FpCOMMENT write SetpCOMMENT;
  property pDATA                          : real    read FpDATA write SetpDATA;
  property pTIPO                          : string  read FpTIPO write SetpTIPO;
  property pSITE                          : string  read FpSITE write SetpSITE;

  public
   constructor Create;
   procedure   GetProperties;
   procedure   ddMap;
   function   GetItem(pList : TListBox) : string;
end;


implementation


constructor oEmpresa.Create;
begin
 // inherited;
 If DBAtu = nil then
  begin
  DBAtu := Tdb.create(TADOConnection);
  // colocar aqui os parámetros da conexão
  end;
  
  DMObject := TDObject(TTempresas.create(nil));
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end ;


{Objeto de negocio oEmpresa}
function oEmpresa.GetItem(pList : TListBox) : string;
begin
 result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;
{ popula os atributos do Objeto de Negócio}
procedure oEmpresa.GetProperties;
begin
    pFANTASIA                  := (dmObject as TTempresas).FANTASIA ;
    pEMPRESA                   := (dmObject as TTempresas).EMPRESA   ;
    pCGC                       := (dmObject as TTempresas).CGC      ;
    pINSCR                     := (dmObject as TTempresas).INSCR    ;
    pENDER                     := (dmObject as TTempresas).ENDER    ;
    pESTADO                    := (dmObject as TTempresas).ESTADO   ;
    pCIDAD                     := (dmObject as TTempresas).CIDAD    ;
    pCEP                       := (dmObject as TTempresas).CEP      ;
    pPAIS                      := (dmObject as TTempresas).PAIS     ;
    pTELEF                     := (dmObject as TTempresas).TELEF    ;
    pTELEF1                    := (dmObject as TTempresas).TELEF1   ;
    pFAX                       := (dmObject as TTempresas).FAX      ;
    pE_MAIL                    := (dmObject as TTempresas).E_MAIL   ;
    pATIV                      := (dmObject as TTempresas).ATIV     ;
    pCOMMENT                   := (dmObject as TTempresas).COMMENT  ;
    pDATA                      := (dmObject as TTempresas).DATA     ;
    pTIPO                      := (dmObject as TTempresas).TIPO     ;
    pSITE                      := (dmObject as TTempresas).SITE     ;
    pk.PK1                     := pfantasia;
    pk.PK1ANT                  := pfantasia;

end;

  { popula as properties do objeto de dados}
procedure oEmpresa.ddmap;
  begin

    (DMObject as TTempresas).FANTASIA := pFANTASIA ;
    (DMObject as TTempresas).EMPRESA  := pEMPRESA  ;
    (DMObject as TTempresas).CGC      := pCGC      ;
    (DMObject as TTempresas).INSCR    := pINSCR    ;
    (DMObject as TTempresas).ENDER    := pENDER    ;
    (DMObject as TTempresas).ESTADO   := pESTADO   ;
    (DMObject as TTempresas).CIDAD    := pCIDAD    ;
    (DMObject as TTempresas).CEP      := pCEP      ;
    (DMObject as TTempresas).PAIS     := pPAIS     ;
    (DMObject as TTempresas).TELEF    := pTELEF    ;
    (DMObject as TTempresas).TELEF1   := pTELEF1   ;
    (DMObject as TTempresas).FAX      := pFAX      ;
    (DMObject as TTempresas).E_MAIL   := pE_MAIL   ;
    (DMObject as TTempresas).ATIV     := pATIV     ;
    (DMObject as TTempresas).COMMENT  := pCOMMENT  ;
    (DMObject as TTempresas).DATA     := pDATA     ;
    (DMObject as TTempresas).TIPO     := pTIPO     ;
    (DMObject as TTempresas).SITE     := pSITE     ;
  end;


procedure oEmpresa.SetpATIV(const Value: string);
begin
  FpATIV := Value;
end;

procedure oEmpresa.SetpCARGO(const Value: string);
begin
  FpCARGO := Value;
end;

procedure oEmpresa.SetpCEP(const Value: string);
begin
  FpCEP := Value;
end;

procedure oEmpresa.SetpCGC(const Value: string);
begin
  FpCGC := Value;
end;

procedure oEmpresa.SetpCIDAD(const Value: string);
begin
  FpCIDAD := Value;
end;

procedure oEmpresa.SetpCOMMENT(const Value: string);
begin
  FpCOMMENT := Value;
end;

procedure oEmpresa.SetpDATA(const Value: real);
begin
  FpDATA := Value;
end;

procedure oEmpresa.SetpE_MAIL(const Value: string);
begin
  FpE_MAIL := Value;
end;

procedure oEmpresa.SetpEmpresa(const Value: string);
begin
  fpEmpresa := value;
end;

procedure oEmpresa.SetpENDER(const Value: string);
begin
  FpENDER := Value;
end;

procedure oEmpresa.SetpESTADO(const Value: string);
begin
  FpESTADO := Value;
end;

procedure oEmpresa.SetpFANTASIA(const Value: string);
begin
  FpFANTASIA := Value;
end;

procedure oEmpresa.SetpFAX(const Value: string);
begin
  FpFAX := Value;
end;

procedure oEmpresa.SetpINSCR(const Value: string);
begin
  FpINSCR := Value;
end;

procedure oEmpresa.SetpPAIS(const Value: string);
begin
  FpPAIS := Value;
end;

procedure oEmpresa.SetpREGIAO(const Value: string);
begin
  FpREGIAO := Value;
end;

procedure oEmpresa.SetpSITE(const Value: string);
begin
  FpSITE := Value;
end;

procedure oEmpresa.SetpTELEF(const Value: string);
begin
  FpTELEF := Value;
end;

procedure oEmpresa.SetpTELEF1(const Value: string);
begin
  FpTELEF1 := Value;
end;

procedure oEmpresa.SetpTIPO(const Value: string);
begin
  FpTIPO := Value;
end;



end.
