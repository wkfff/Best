unit CV_MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons,cls_bd,bstdb, StdCtrls;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    dst_ado: TADOConnection;
    qry: TADOQuery;
    qry_ins: TADOQuery;
    qry_src: TADOQuery;
    Memo1: TMemo;
    lb: TListBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function Monta_qry(pField: string): string;
    procedure Monta_fld;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  pList,ptab: TstringList;
  atrib,cp ,fld: string;
lst_atrib : tstringList;
vr : variant;
implementation

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
i ,k: integer;

begin
  pList := TstringList.Create;
  lst_atrib := TstringList.Create;
  qry_src.Connection := bdx;
  decimalseparator := '.';
  with dst_ado do
   Begin
      getTablenames(pList,false);

      //limpa destino
      for i := 0 to pList.Count -1 do
       Begin
        If (pList[i] = 'ARI_AREA_INTERESSE') or (pList[i] = 'IDG_CLASS')  or
           (pList[i] = 'PROVIDER_DATA') then
           continue;
           // limpa destino
           with qry do
            Begin
             close;
             sql.clear;
             sql.add('DELETE FROM '+''+pList[i]+'');
             execsql;
            end;



           lst_atrib.Clear;
           bdx.GetFieldNames(pList[i],lst_atrib);
           
            // le origem
        try
            with qry_src do
            Begin
             close;
             sql.clear;
             sql.add('SELECT * FROM '+''+pList[i]+'');
             open;
         
             while not qry_src.eof do
               begin
               Monta_qry('');
               MOnta_fld;

               
               with qry_ins do
                 Begin
                  close;
                  sql.clear;
                  sql.add('INSERT INTO '+''+pList[i]+'('+atrib+')');
                  sql.add(' VALUES ('+fld+')');
                  memo1.text := sql.Text;
                  execsql;
                 end;


                 qry_src.next;
              end;
              lb.Items.Add(pList[i]);
              lb.repaint;
            end;
         except
           memo1.text := qry_ins.sql.Text;
           raise;
         end;

       end;
   end;


end;

procedure TForm2.Monta_fld;
var
 k : integer;
Begin
   fld := '';
   for k := 0 to lst_atrib.Count -1 do
      Begin
       cp := lst_atrib[k] ;
       vr := qry_src.fieldbyname(cp).value;
       If vr = null then
        continue;

        vr := quotedstr(vr);

       If fld = '' then
           fld   := fld+vr
       else
         fld:= fld + ','+vr ;
      end;
end;


function TForm2.Monta_qry(pField : string) : string ;
var

k : integer;
Begin
  atrib := '';
  for k := 0 to lst_atrib.Count -1 do
      Begin
        cp := lst_atrib[k] ;
       vr := qry_src.fieldbyname(cp).value;
       If vr = null then
        continue;
       If atrib = '' then
          atrib := atrib +lst_atrib[k]
       else
          atrib := atrib + ','+lst_atrib[k] ;
      end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  try
      begin
        If bdx = nil then
           bdx := TBd.create(true);
      end;
     except
      begin
         freeandnil(bdx);
         raise;
         showmessage('Não foi possível abrir o Banco de dados!'+#13+'Verificar as Configurações!');
      end;
     end;
     bdx.Connected := false;
     bdx.Mode := (cmShareExclusive);

    { ptab := tstringlist.Create;
     ptab[0] := 'CLI_CLIENTE';
     ptab[1] := 'CMB_DIVERSOS';

     ptab[2] := 'CLI_CLIENTE';
     ptab[3] := 'CLI_CLIENTE';
     ptab[4] := 'CLI_CLIENTE';
     ptab[5] := 'CLI_CLIENTE';
     ptab[6] := 'CLI_CLIENTE';
     ptab[7] := 'CLI_CLIENTE';
     ptab[8] := 'CLI_CLIENTE';
     ptab[9] := 'CLI_CLIENTE';
     ptab[10] := 'CLI_CLIENTE'; }

end;

end.
