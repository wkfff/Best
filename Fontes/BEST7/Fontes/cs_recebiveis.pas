unit cs_recebiveis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart,dateutils, DBCtrls,
  DBClient, Provider,fonctions;

type
  TForm7 = class(TForm)
    DataSource3: TDataSource;
    QRY_GER: TADOQuery;
    QRY_GERDATA_RECEBIMENTO: TDateTimeField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    ComboBox4: TComboBox;
    Label7: TLabel;
    DateTimePicker2: TDateTimePicker;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    qry_venda: TADOQuery;
    DataSource4: TDataSource;
    TabSheet3: TTabSheet;
    dt: TMonthCalendar;
    DBGrid3: TDBGrid;
    DBChart1: TDBChart;
    Series1: TAreaSeries;
    Label9: TLabel;
    Edit2: TEdit;
    qry_curva: TADOQuery;
    qry_curvaCURVA_DATA: TDateTimeField;
    qry_curvaCURVA_DIA: TIntegerField;
    qry_curvaCURVA_PERCENTUAL: TFloatField;
    qry_curvaPRC: TFloatField;
    qry_curvadayof: TStringField;
    DataSource5: TDataSource;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    Label10: TLabel;
    QRY_GERVALOR: TFloatField;
    QRY_GERJUROS: TFloatField;
    QRY_GERMULTA: TFloatField;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    QRY_CONGELADO: TADOQuery;
    DataSource7: TDataSource;
    ADOCONG: TADOConnection;
    ADOConnection1: TADOConnection;
    DataSetProvider1: TDataSetProvider;
    FCLIENT: TClientDataSet;
    FCLIENTDATA_RECEBIMENTO: TDateTimeField;
    FCLIENTVALOR: TFloatField;
    FCLIENTJUROS: TFloatField;
    FCLIENTMULTA: TFloatField;
    Label6: TLabel;
    EDIT3: TLabel;
    EDIT4: TLabel;
    EDIT5: TLabel;
    DataSetProvider2: TDataSetProvider;
    fclient1: TClientDataSet;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    qry_fer: TADOQuery;
    DataSource8: TDataSource;
    Edit6: TEdit;
    qry_vendaDATA_RECEBIMENTO: TDateTimeField;
    qry_vendaVENDA: TFloatField;
    fclientvenda: TClientDataSet;
    DataSetProvider3: TDataSetProvider;
    fclientvendaDATA_RECEBIMENTO: TDateTimeField;
    fclientvendaVENDA: TFloatField;
    Edit7: TEdit;
    Label11: TLabel;
    QRY_GERPTOTTIT: TFloatField;
    TOT: TLabel;
    FCLIENTPTOTTIT: TFloatField;
    QRY_GERVENDA: TFloatField;
    VEND: TLabel;
    FCLIENTVENDA2: TFloatField;
    QRY_GERptotger: TFloatField;
    FCLIENTptotger: TFloatField;
    totger: TLabel;
    TabSheet5: TTabSheet;
    dt1: TMonthCalendar;
    Edit8: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit10: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    qry_regiao: TADOQuery;
    src_regiao: TDataSource;
    qry_gerencia: TADOQuery;
    src_gerencia: TDataSource;
    qry_setor: TADOQuery;
    src_setor: TDataSource;
    Panel1: TPanel;
    rdg: TRadioGroup;
    cmb_reg: TDBLookupComboBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    cmb_setor: TDBLookupComboBox;
    cmb_gerencia: TDBLookupComboBox;
    Label4: TLabel;
    ED_DATA: TEdit;
    DTP: TDateTimePicker;
    Edit14: TEdit;
    QRY_CONGELADODATA_PROCESSAMENTO: TDateTimeField;
    QRY_CONGELADOVALOR: TFloatField;
    fclient1DATA_PROCESSAMENTO: TDateTimeField;
    fclient1VALOR: TFloatField;
    QRY_CONGELADOGERENCIA_VENDA: TSmallintField;
    fclient1GERENCIA_VENDA: TSmallintField;
    DTP1: TDateTimePicker;
    Edit15: TEdit;
    qry_curvaDAYWEEK: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dtDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cmb_gerenciaCloseUp(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure QRY_GERCalcFields(DataSet: TDataSet);
    procedure dt1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cmb_regCloseUp(Sender: TObject);
    procedure cmb_setorCloseUp(Sender: TObject);
    procedure DTPCloseUp(Sender: TObject);
    procedure rdgClick(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure DTP1CloseUp(Sender: TObject);
    procedure qry_curvaCalcFields(DataSet: TDataSet);
  private
    
    { Private declarations }
  public
   function Dias_uteis(pData: real; pDiasuteis: integer): real;
    { Public declarations }
  end;

var
  Form7: TForm7;
  afer : array of real;
implementation

uses ccc;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
 qry_regiao.open;
 qry_gerencia.open;
 qry_setor.open;
 dt.Date := incyear(Date,-1);

 with qry_fer do
  Begin
   close;
   sql.clear;
   sql.add('SELECT * FROM FERIADOS');
   open;
   While not eof do
    Begin
     setlength(aFer,length(aFer) +1 );
     aFer [length(aFer)-1] := fieldbyname('DATA_FERIADO').AsFloat;
     next;
    end;

  end;


end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
var
conec : string;
begin
If rdg.ItemIndex = -1 then
 edit14.Text := 'Brasil'
else
  edit14.Text := rdg.Items[rdg.itemindex]+' '+ edit14.Text;
   DBGRID1.Columns[5].FieldName := 'VENDA';
         DBGRID1.Columns[6].FieldName := 'PTOTGER';
with qry_GER do
  Begin
     conec := 'WHERE ';
     CLOSE;
     SQL.CLEAR;
     fclient.Active := false;
     SQL.ADD('SELECT R.DATA_RECEBIMENTO,SUM(R.VALOR_SALDO) AS VALOR, ');
     SQL.ADD('         SUM(R.VALOR_JUROS) AS JUROS,SUM(R.VALOR_MULTA) AS MULTA, ');
     SQL.ADD('         (SELECT SUM(A.VALOR_VENDAS) AS VENDA  ');
     SQL.ADD('          FROM VENDAS_ACUM A  ');

     SQL.ADD('          WHERE A.DATA_RECEBIMENTO = R.DATA_RECEBIMENTO ');
      If edit11.Text <> '' then
      Begin
        SQL.ADD('AND A.REGIAO_ESTRATEGICA = R.REGIAO_ESTRATEGICA');
       
      end;
     SQL.ADD('         ) AS VENDA  ');
     SQL.ADD('         FROM RECEBIVEIS_ACUM R  ');
     If ed_data.text <> '' then
        Begin
          SQL.ADD(CONEC +'R.DATA_RECEBIMENTO = '+'#'+formatdatetime('yyyy/mm/dd',strtodate(ED_DATA.text))+'#');
          conec := ' AND ';
        end;

     If edit11.Text <> '' then
      Begin
        SQL.ADD(CONEC +'R.REGIAO_ESTRATEGICA = '+''+qry_regiao.fieldbyname('REGIAO_ID').asstring+'');
        conec := ' AND ';
      end;
     If edit12.Text <> '' then
      Begin
        SQL.ADD(CONEC +' R.GERENCIA_VENDA = '+''+qry_gerencia.fieldbyname('GERENCIA_ID').asstring+'');
        DBGRID1.Columns[5].FieldName := '';
        DBGRID1.Columns[6].FieldName := '';
        conec := ' AND ';
      end;
     If edit13.Text <> '' then
      Begin
        SQL.ADD(CONEC +'R.SETOR = '+''+qry_setor.fieldbyname('setor_ID').asstring+'');
        DBGRID1.Columns[5].FieldName := '';
        DBGRID1.Columns[6].FieldName := '';

        conec := ' AND ';
      end;
      If edit11.Text <> '' then
          SQL.ADD('         GROUP BY R.DATA_RECEBIMENTO,R.REGIAO_ESTRATEGICA ')
      ELSE
         SQL.ADD('         GROUP BY R.DATA_RECEBIMENTO ') ;
     SQL.ADD('         ORDER BY R.DATA_RECEBIMENTO ');
    // SQL.SaveToFile('C:\SQL.TXT');
     open;
     fclient.Active := true;
     If fclient.Aggregates[0].Value > 0 then
        edit3.caption := floattostrf(fclient.Aggregates[0].Value,ffnumber,12,2);
     If fclient.Aggregates[1].Value > 0 then
        edit4.caption := floattostrf(fclient.Aggregates[1].Value,ffnumber,12,2);
     If fclient.Aggregates[2].Value > 0 then
        edit5.caption := floattostrf(fclient.Aggregates[2].Value,ffnumber,12,2);
     If fclient.Aggregates[3].Value > 0 then
        TOT.caption := floattostrf(fclient.Aggregates[3].Value,ffnumber,12,2);

     if DBGRID1.Columns[5].FieldName <> ''then
      Begin

         If fclient.Aggregates[4].Value > 0 then
            VEND.caption := floattostrf(fclient.Aggregates[4].Value,ffnumber,12,2);
        If fclient.Aggregates[5].Value > 0 then
          totger.caption := floattostrf(fclient.Aggregates[5].Value,ffnumber,12,2);
      end
     else
      Begin
       vend.caption:= '';
       totger.caption := '';
      end;

    
  end;

end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
 {  with qry_venda do
 Begin
   CLOSE;
     SQL.CLEAR;
     sql.add('SELECT DATA_RECEBIMENTO,SUM(VALOR_VENDAS) AS VENDA');
     sql.add('FROM VENDAS_ACUM');
     sql.add('GROUP BY DATA_RECEBIMENTO');
     sql.add('ORDER BY DATA_RECEBIMENTO ');
     open;  
  end;  }

  QRY_VENDA.Open;
   fclientvenda.Active := true;
     fclientvenda.Aggregates.Add;
     fclientvenda.Aggregates[0].Expression    := 'SUM(VENDA)';
     fclientvenda.Aggregates[0].GroupingLevel := 0;
     fclientvenda.Aggregates[0].Active := true;
   edit7.Text :=  floattostrf(fclientvenda.Aggregates[0].Value,ffnumber,12,2);
end;

procedure TForm7.dtDblClick(Sender: TObject);
begin
 edit2.Text :=  formatdatetime('dd/mm/yyyy',dt.Date);
SpeedButton3Click(nil);
end;

procedure TForm7.SpeedButton3Click(Sender: TObject);
var
wdat : string;
begin
  wdat := formatdatetime('yyyy/mm/dd',strtodate(edit2.Text));
  with qry_curva do
   Begin
     close;
     sql.clear;
     sql.add('SELECT CURVA_DATA,CURVA_PERCENTUAL,CURVA_DIA,CURVA_PERCENTUAL * 100 AS PRC FROM CURVAS ');
     If edit1.Text <> '' then
      Begin
            sql.add('WHERE GERENCIA_VENDA = '+''+edit1.Text+'');
            sql.add('AND CURVA_DATA = '+ '#'+ wdat +'#');
      end
    else
    Raise exception.create('Informar a Gerencia de Venda');
    
     open;
   end;
end;

procedure TForm7.cmb_gerenciaCloseUp(Sender: TObject);
begin
  edit12.Text := cmb_gerencia.text;
  //edit3.Text := cmb_gerencia.text;
end;

function TForm7.Dias_uteis(pData : real;pDiasuteis : integer) : real;
var
wdat : reAl;
i,d,j : integer;
begin
 wdat := pdata;
 i := 0;
 d := 1;
 result := 0;
 if pDiasuteis < 0 then
  d := -1;

 while i < abs(pDiasuteis) do
  Begin
     wdat := wdat + d ;
     If dayoftheweek(wdat) in [6,7] then //sab,dom
        continue;
     for j := 0 to length(aFer) - 1 do
      Begin
       If wdat = aFer[j] then
        continue;
      end;
    { with qry_fer do
      Begin
       close;
       sql.clear;
       sql.add('SELECT * FROM FERIADOS');
       sql.add('WHERE DATA_FERIADO = '+'#'+FORMATDATETIME('YYYY/MM/DD',wdat)+'#');
       open;
       If not eof then
        continue;
      end; }
      inc(i);

  end;
  result := WDAT;
end;

procedure TForm7.SpeedButton4Click(Sender: TObject);
begin
dbgrid4.DataSource := nil;
 with qry_congelado do
  Begin
   fclient1.Active := false;
   close;
   sql.clear;
   
   sql.add('SELECT SUM(VALOR_VENCTO) AS VALOR,');
   sql.add(' GERENCIA_VENDA,');
   sql.add('DATA_PROCESSAMENTO');
   sql.add('FROM TITULOS_ACUMULADOS ');
   If edit15.Text <> '' then
      SQL.ADD('WHERE DATA_PROCESSAMENTO = '+'#'+FORMATDATETIME('YYYY/MM/DD',strtodate(edit15.text))+'#');
   sql.add('GROUP BY DATA_PROCESSAMENTO,GERENCIA_VENDA ');
   open;
   fclient1.Active := true;
   fclient1.Aggregates.Add;
   fclient1.Aggregates[0].Expression    := 'SUM(VALOR)';
   fclient1.Aggregates[0].GroupingLevel := 0;
   fclient1.Aggregates[0].Active := true;

   If fclient1.Aggregates[0].Value > 0 then
        LABEL8.caption := floattostrf(fclient1.Aggregates[0].Value,ffnumber,12,2);
   dbgrid4.DataSource := datasource7;
  end;
end;

procedure TForm7.DBGrid3CellClick(Column: TColumn);
begin
  edit6.Text := formatdatetime('dd/mm/yyyy', Dias_uteis(dt.Date,dbgrid3.DataSource.DataSet.fieldbyname('CURVA_DIA').asinteger));
  dbgrid3.DataSource.DataSet.edit;
  dbgrid3.DataSource.DataSet.FieldByName('dayof').value := edit6.text;
end;

procedure TForm7.QRY_GERCalcFields(DataSet: TDataSet);
begin
   DATASET.FieldByName('ptottit').Value := dataset.fieldbyname('VALOR').Value +
                                          dataset.fieldbyname('JUROS').Value +
                                          dataset.fieldbyname('MULTA').Value ;
   DATASET.FieldByName('ptotger').Value := dataset.fieldbyname('VALOR').Value +
                                          dataset.fieldbyname('JUROS').Value +
                                          dataset.fieldbyname('VENDA').Value +
                                          dataset.fieldbyname('MULTA').Value ;
end;

procedure TForm7.dt1DblClick(Sender: TObject);
begin

  edit10.Text := formatdatetime('dd/mm/yyyy',dt1.date) ;
  label17.caption := formatdatetime('ddd',dt1.Date);
  edit9.text := formatdatetime('dd/mm/yyyy',dias_uteis(dt1.Date,strtoint(edit8.text)));
  label18.caption := formatdatetime('ddd',strtodate(edit9.Text));
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
  ListPrt(dbgrid1,'Recebíveis','');
end;

procedure TForm7.SpeedButton6Click(Sender: TObject);
begin
  Listprt(dbgrid3,'Curva Região '+edit1.Text+ ' do dia '+edit6.text,'');
end;

procedure TForm7.cmb_regCloseUp(Sender: TObject);
begin
  edit11.Text := cmb_reg.text;
end;

procedure TForm7.cmb_setorCloseUp(Sender: TObject);
begin
  edit13.Text := cmb_setor.text;
end;

procedure TForm7.DTPCloseUp(Sender: TObject);
begin
  ED_DATA.text:= formatdatetime('dd/mm/yyyy',dtp.date);
end;

procedure TForm7.rdgClick(Sender: TObject);
begin
  cmb_reg.Visible := false;
  edit11.Visible := false;
  cmb_gerencia.Visible := false;
  edit12.Visible := false;
  cmb_setor.Visible := false;
  edit13.Visible := false;
  EDIT11.Text := '';
  EDIT12.Text := '';
  EDIT13.Text := '';

  case rdg.itemindex of
    0 : Begin
         cmb_reg.Visible := true;
         edit11.Visible := true;
        end;

    1 : Begin
         cmb_gerencia.Visible := true;
         edit12.Visible := true;
        end;

    2 : Begin
         cmb_setor.Visible := true;
         edit13.Visible := true;
        end;



  end;
 
end;

procedure TForm7.Edit11Change(Sender: TObject);
begin
  edit14.Text := edit11.Text;
end;

procedure TForm7.Edit12Change(Sender: TObject);
begin
 edit14.Text := edit12.Text;
end;

procedure TForm7.Edit13Change(Sender: TObject);
begin
   edit14.Text := edit13.Text;
end;

procedure TForm7.DTP1CloseUp(Sender: TObject);
begin
 edit15.text := formatdatetime('dd/mm/yyyy',dtp1.date);
end;

procedure TForm7.qry_curvaCalcFields(DataSet: TDataSet);
var
i : integer;
begin
 // dataset.edit    ;
 dataset.fieldbyname('dayOf').asdatetime := Dias_uteis(dt.date, dataset.fieldbyname('CURVA_DIA').asinteger) ;
 dataset.fieldbyname('dayWEEK').asstring := formatdatetime('ddd',dataset.fieldbyname('dayOf').asdatetime);


end;

end.

