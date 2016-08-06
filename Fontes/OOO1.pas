unit OOO1;

interface
{INICIO USES}

 uses
Aligrid,DataTier,
  windows,DB, ADODB,forms,Messages,Dialogs,basetier,variants,
  stdctrls,classes,db_tier;

{FIM USES}

{INICIO CLASSES}
  
{Início Classe OEMPRESA}
type
 {Classe OEMPRESA}
OEMPRESA = Class(TOObject)
     private
      FID_EMP                                             : integer ;
      FATIV                                               : string ;
      FCEP                                                : string ;
      FCGC                                                : string ;
      FCIDAD                                              : string ;
      FCOMMENT                                            : string ;
      FDATAT                                              : real ;
      FE_MAIL                                             : string ;
      FEMPRESA                                            : string ;
      FENDER                                              : string ;
      FESTADO                                             : string ;
      FFANTASIA                                           : string ;
      FFAX                                                : string ;
      FINSCR                                              : string ;
      FPAIS                                               : string ;
      FSITE                                               : string ;
      FTELEF                                              : string ;
      FTELEF1                                             : string ;
      FTIPO                                               : string ;
      oEMPRESAant : oEMPRESA;
      procedure SetID_EMP(const value   : integer );
      procedure SetATIV(const value   : string );
      procedure SetCEP(const value   : string );
      procedure SetCGC(const value   : string );
      procedure SetCIDAD(const value   : string );
      procedure SetCOMMENT(const value   : string );
      procedure SetDATAT(const value   : real );
      procedure SetE_MAIL(const value   : string );
      procedure SetEMPRESA(const value   : string );
      procedure SetENDER(const value   : string );
      procedure SetESTADO(const value   : string );
      procedure SetFANTASIA(const value   : string );
      procedure SetFAX(const value   : string );
      procedure SetINSCR(const value   : string );
      procedure SetPAIS(const value   : string );
      procedure SetSITE(const value   : string );
      procedure SetTELEF(const value   : string );
      procedure SetTELEF1(const value   : string );
      procedure SetTIPO(const value   : string );

 published
   property ID_EMP              : integer  read FID_EMP write SetID_EMP;
   property ATIV                : string   read FATIV write SetATIV;
   property CEP                 : string   read FCEP write SetCEP;
   property CGC                 : string   read FCGC write SetCGC;
   property CIDAD               : string   read FCIDAD write SetCIDAD;
   property COMMENT             : string   read FCOMMENT write SetCOMMENT;
   property DATAT               : real     read FDATAT write SetDATAT;
   property E_MAIL              : string   read FE_MAIL write SetE_MAIL;
   property EMPRESA             : string   read FEMPRESA write SetEMPRESA;
   property ENDER               : string   read FENDER write SetENDER;
   property ESTADO              : string   read FESTADO write SetESTADO;
   property FANTASIA            : string   read FFANTASIA write SetFANTASIA;
   property FAX                 : string   read FFAX write SetFAX;
   property INSCR               : string   read FINSCR write SetINSCR;
   property PAIS                : string   read FPAIS write SetPAIS;
   property SITE                : string   read FSITE write SetSITE;
   property TELEF               : string   read FTELEF write SetTELEF;
   property TELEF1              : string   read FTELEF1 write SetTELEF1;
   property TIPO                : string   read FTIPO write SetTIPO;

{construtor}
  constructor Create ;override;
{destuctor}
  destructor Destroy ;override;
end;  
{}
 TEMPRESASDM = class (TDad) 
   public  
      procedure PopulateObject (PDObject: TOObject); override;
      procedure PopulateFields (PDObject: TOObject); override; 
   end; 

{Fim Classe OEMPRESA}


{FIM CLASSES}
  {Inicio Const OEMPRESA}
const
aoEMPRESAcpos : array[0..18] of string = ('ID_EMP','ATIV','CEP','CGC','CIDAD','COMMENT','DATAT','E_MAIL','EMPRESA','ENDER','ESTADO','FANTASIA','FAX','INSCR','PAIS','SITE','TELEF','TELEF1','TIPO');
aoEMPRESAcapt :array[0..18] of string = ('ID','Ativ.','Cep','CGC','Cidade','Comentários','Dt. Atualização','mail','Razão Social','Endereço','UF','Fantasia','Fax','IE','Pais','Site','Tel.','Tel.','Tipo');

{Fim Const OEMPRESA}


implementation


{INICIO METODOS}

  {Início Métodos OEMPRESA}
constructor oEMPRESA.create;
 begin
   inherited;
   Chave         := 'ID_EMP';
   DMObject      := TEMPRESASDM.create;
   AtributoLista := 'FANTASIA';
   PK            := TPK.create;
end;

destructor oEMPRESA.destroy;
 begin
   DMObject.free;
   inherited;
end;

procedure TEMPRESASDM.PopulateObject (PDObject: TOObject);
 begin
   with OEMPRESA(PDObject) do
      begin
        ID_EMP                    := integerfield['ID_EMP'];
        ATIV                      := stringfield['ATIV'];
        CEP                       := stringfield['CEP'];
        CGC                       := stringfield['CGC'];
        CIDAD                     := stringfield['CIDAD'];
        COMMENT                   := stringfield['COMMENT'];
        DATAT                     := datetimefield['DATAT'];
        E_MAIL                    := stringfield['E_MAIL'];
        EMPRESA                   := stringfield['EMPRESA'];
        ENDER                     := stringfield['ENDER'];
        ESTADO                    := stringfield['ESTADO'];
        FANTASIA                  := stringfield['FANTASIA'];
        FAX                       := stringfield['FAX'];
        INSCR                     := stringfield['INSCR'];
        PAIS                      := stringfield['PAIS'];
        SITE                      := stringfield['SITE'];
        TELEF                     := stringfield['TELEF'];
        TELEF1                    := stringfield['TELEF1'];
        TIPO                      := stringfield['TIPO'];
      end;
      If OEMPRESA(PDObject).OEMPRESAant =  nil then
         OEMPRESA(PDObject).OEMPRESAant := OEMPRESA.create;
      with OEMPRESA(PDObject).OEMPRESAant do
        Begin
          ID_EMP                    := integerfield['ID_EMP'];
          ATIV                      := stringfield['ATIV'];
          CEP                       := stringfield['CEP'];
          CGC                       := stringfield['CGC'];
          CIDAD                     := stringfield['CIDAD'];
          COMMENT                   := stringfield['COMMENT'];
          DATAT                     := datetimefield['DATAT'];
          E_MAIL                    := stringfield['E_MAIL'];
          EMPRESA                   := stringfield['EMPRESA'];
          ENDER                     := stringfield['ENDER'];
          ESTADO                    := stringfield['ESTADO'];
          FANTASIA                  := stringfield['FANTASIA'];
          FAX                       := stringfield['FAX'];
          INSCR                     := stringfield['INSCR'];
          PAIS                      := stringfield['PAIS'];
          SITE                      := stringfield['SITE'];
          TELEF                     := stringfield['TELEF'];
          TELEF1                    := stringfield['TELEF1'];
          TIPO                      := stringfield['TIPO'];
        end;
 end;

procedure TEMPRESASDM.PopulateFields (PDObject: TOObject);
begin
  with OEMPRESA(PDObject) do
  begin
  If PDObject.id <> 0 then
   begin
    

        If OEMPRESA(PDObject).OEMPRESAant.ID_EMP <> ID_EMP then
          integerfield['ID_EMP']              := ID_EMP              ;
        If OEMPRESA(PDObject).OEMPRESAant.ATIV <> ATIV then
        stringfield['ATIV']                 := ATIV                ;
        If OEMPRESA(PDObject).OEMPRESAant.CEP <> CEP then
        stringfield['CEP']                  := CEP                 ;
        If OEMPRESA(PDObject).OEMPRESAant.CGC <> CGC then
        stringfield['CGC']                  := CGC                 ;
        If OEMPRESA(PDObject).OEMPRESAant.CIDAD <> CIDAD then
        stringfield['CIDAD']                := CIDAD               ;
        If OEMPRESA(PDObject).OEMPRESAant.COMMENT <> COMMENT then
        stringfield['COMMENT']              := COMMENT             ;
        If OEMPRESA(PDObject).OEMPRESAant.DATAT <> DATAT then
        dateTimefield['DATAT']              := DATAT               ;
        If OEMPRESA(PDObject).OEMPRESAant.E_MAIL <> E_MAIL then
        stringfield['E_MAIL']               := E_MAIL              ;
        If OEMPRESA(PDObject).OEMPRESAant.EMPRESA <> EMPRESA then
        stringfield['EMPRESA']              := EMPRESA             ;
        If OEMPRESA(PDObject).OEMPRESAant.ENDER <> ENDER then
        stringfield['ENDER']                := ENDER               ;
        If OEMPRESA(PDObject).OEMPRESAant.ESTADO <> ESTADO then
        stringfield['ESTADO']               := ESTADO              ;
        If OEMPRESA(PDObject).OEMPRESAant.FANTASIA <> FANTASIA then
        stringfield['FANTASIA']             := FANTASIA            ;
        If OEMPRESA(PDObject).OEMPRESAant.FAX <> FAX then
        stringfield['FAX']                  := FAX                 ;
        If OEMPRESA(PDObject).OEMPRESAant.INSCR <> INSCR then
        stringfield['INSCR']                := INSCR               ;
        If OEMPRESA(PDObject).OEMPRESAant.PAIS <> PAIS then
        stringfield['PAIS']                 := PAIS                ;
        If OEMPRESA(PDObject).OEMPRESAant.SITE <> SITE then
        stringfield['SITE']                 := SITE                ;
        If OEMPRESA(PDObject).OEMPRESAant.TELEF <> TELEF then
        stringfield['TELEF']                := TELEF               ;
        If OEMPRESA(PDObject).OEMPRESAant.TELEF1 <> TELEF1 then
        stringfield['TELEF1']               := TELEF1              ;
        If OEMPRESA(PDObject).OEMPRESAant.TIPO <> TIPO then
        stringfield['TIPO']                 := TIPO                ;
      //  OEMPRESA(PDObject).OEMPRESAant.free;
     
     end
  else
    begin
        integerfield['ID_EMP']              := ID_EMP              ;
        stringfield['ATIV']                 := ATIV                ;
        stringfield['CEP']                  := CEP                 ;
        stringfield['CGC']                  := CGC                 ;
        stringfield['CIDAD']                := CIDAD               ;
        stringfield['COMMENT']              := COMMENT             ;
        dateTimefield['DATAT']              := DATAT               ;
        stringfield['E_MAIL']               := E_MAIL              ;
        stringfield['EMPRESA']              := EMPRESA             ;
        stringfield['ENDER']                := ENDER               ;
        stringfield['ESTADO']               := ESTADO              ;
        stringfield['FANTASIA']             := FANTASIA            ;
        stringfield['FAX']                  := FAX                 ;
        stringfield['INSCR']                := INSCR               ;
        stringfield['PAIS']                 := PAIS                ;
        stringfield['SITE']                 := SITE                ;
        stringfield['TELEF']                := TELEF               ;
        stringfield['TELEF1']               := TELEF1              ;
        stringfield['TIPO']                 := TIPO                ;
    end;
    end;
 end;

{Fim Métodos OEMPRESA}


{FIM METODOS}




{INICIO SET VALUES}
  {Início Set Values OEMPRESA}
{Set Value OEMPRESA}

procedure OEMPRESA.SetID_EMP(const value   : integer );
 begin
  FID_EMP := value;
 end;

procedure OEMPRESA.SetATIV(const value   : string );
 begin
  FATIV := value;
 end;

procedure OEMPRESA.SetCEP(const value   : string );
 begin
  FCEP := value;
 end;

procedure OEMPRESA.SetCGC(const value   : string );
 begin
  FCGC := value;
 end;

procedure OEMPRESA.SetCIDAD(const value   : string );
 begin
  FCIDAD := value;
 end;

procedure OEMPRESA.SetCOMMENT(const value   : string );
 begin
  FCOMMENT := value;
 end;

procedure OEMPRESA.SetDATAT(const value   : real );
 begin
  FDATAT := value;
 end;

procedure OEMPRESA.SetE_MAIL(const value   : string );
 begin
  FE_MAIL := value;
 end;

procedure OEMPRESA.SetEMPRESA(const value   : string );
 begin
  FEMPRESA := value;
 end;

procedure OEMPRESA.SetENDER(const value   : string );
 begin
  FENDER := value;
 end;

procedure OEMPRESA.SetESTADO(const value   : string );
 begin
  FESTADO := value;
 end;

procedure OEMPRESA.SetFANTASIA(const value   : string );
 begin
  FFANTASIA := value;
 end;

procedure OEMPRESA.SetFAX(const value   : string );
 begin
  FFAX := value;
 end;

procedure OEMPRESA.SetINSCR(const value   : string );
 begin
  FINSCR := value;
 end;

procedure OEMPRESA.SetPAIS(const value   : string );
 begin
  FPAIS := value;
 end;

procedure OEMPRESA.SetSITE(const value   : string );
 begin
  FSITE := value;
 end;

procedure OEMPRESA.SetTELEF(const value   : string );
 begin
  FTELEF := value;
 end;

procedure OEMPRESA.SetTELEF1(const value   : string );
 begin
  FTELEF1 := value;
 end;

procedure OEMPRESA.SetTIPO(const value   : string );
 begin
  FTIPO := value;
 end;

{Fim Set Values OEMPRESA}


{FIM SET VALUES}

end.
