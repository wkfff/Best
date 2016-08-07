unit basetier;

interface

uses classes,stdctrls,aligrid;

const
  NoID = 0;



type
  TObjectID = type variant;

  TPk = class
  private
    FPK1: variant;
    FPK3: variant;
    FPK2: variant;
    FPK3ANT: VARIANT;
    FPK1ANT: VARIANT;
    FPK2ANT: VARIANT;

    procedure SetPK1(const Value: variant);
    procedure SetPK2(const Value: variant);
    procedure SetPK3(const Value: variant);
    procedure SetPK1ANT(const Value: VARIANT);
    procedure SetPK2ANT(const Value: VARIANT);
    procedure SetPK3ANT(const Value: VARIANT);


  published
   property PK1 : variant read FPK1 write SetPK1;
   property PK2 : variant  read FPK2 write SetPK2;
   property PK3 : variant  read FPK3 write SetPK3;
   property PK1ANT : VARIANT read FPK1ANT write SetPK1ANT;
   property PK2ANT : VARIANT read FPK2ANT write SetPK2ANT;
   property PK3ANT : VARIANT read FPK3ANT write SetPK3ANT;
  end;

  TResulta = Type  variant ;

  TDObject = class;

  TOObject = class
  private
    FID: TObjectID;
    FPK: tpk;
    Fresulta: Tresulta;
    FLista: TStringList;
    FAtributoLista: string;
    FListaGrid: TStringAlignGrid;
    procedure SetPK(const Value: tpk);
    procedure Setresulta(const Value: Tresulta);
    procedure SetLista(const Value: TStringList);
    procedure SetAtributoLista(const Value: string);
    procedure SetListaGrid(const Value: TStringAlignGrid);
  protected
    DMObject: TDObject;
  public
    procedure Load (ID: TObjectID); virtual;
    procedure Save; virtual;
    procedure Delete; virtual;
    procedure GetAll;virtual;
    function  GetItem(pList : TListBox) : string;virtual;
    property  ID: TObjectID read FID;
    property  PK : tpk read FPK write SetPK;
    property  resulta : Tresulta read Fresulta write Setresulta; // mensagem da operação
    property  Lista : TStringList read FLista write SetLista;    // Lsita dos objetos mostrados no form
    property  ListaGrid : TStringAlignGrid read FListaGrid write SetListaGrid;
    property  AtributoLista : string read FAtributoLista write SetAtributoLista;                            // atributo a ser listado na Lista acima
  end;

  TDObject = class
  protected
    procedure LoadObject (PDObject: TOObject); virtual; abstract;
    function  SaveObject (PDObject: TOObject): TObjectID ; virtual; abstract ;
    procedure DeleteObject (PDObject: TOObject); virtual; abstract;
    function  GetAllObjects (PDObject: TOObject) : TStringList; virtual; abstract;
    
  end;


implementation


// TOObject   : objeto de negócio

procedure TOObject.Load (ID: TObjectID);
begin
  FID := ID;
  DMObject.LoadObject (Self);

end;

procedure TOObject.Save;
begin
  FID := DMObject.SaveObject (Self);
end;

procedure TOObject.Delete;
begin
  DMObject.DeleteObject (Self);
end;

procedure TOObject.GetAll;
begin
  fLista := DMObject.GetAllObjects (Self);
end;


{ TPk }


procedure TPk.SetPK1(const Value: variant);
begin
  FPK1 := Value;
end;

procedure TPk.SetPK1ANT(const Value: VARIANT);
begin
  FPK1ANT := Value;
end;

procedure TPk.SetPK2(const Value: variant);
begin
  FPK2 := Value;
end;

procedure TPk.SetPK2ANT(const Value: VARIANT);
begin
  FPK2ANT := Value;
end;

procedure TPk.SetPK3(const Value: variant);
begin
  FPK3 := Value;
end;

procedure TOObject.SetPK(const Value: tpk);
begin
  FPK := Value;
end;

procedure TPk.SetPK3ANT(const Value: VARIANT);
begin
  FPK3ANT := Value;
end;

procedure TOObject.Setresulta(const Value: Tresulta);
begin
  Fresulta := Value;
end;

procedure TOObject.SeTLista(const Value: TStringList);
begin
  FLista := Value;
end;

{ retorna ítem escolhido na lista}
function  TOObject.GetItem(pList: TListBox) : string;
begin
 result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

procedure TOObject.SetAtributoLista(const Value: string);
begin
  FAtributoLista := Value;
end;

procedure TOObject.SetListaGrid(const Value: TStringAlignGrid);
begin
  FListaGrid := Value;
end;

end.

