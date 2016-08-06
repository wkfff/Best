unit bst_qry;

interface

uses
  Windows, Messages, BST_BASEFRM,SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, DB, ADODB, Menus,
  ComCtrls,cls_utils, ImgList,Fonctions;

type
  Tfrm_qry = class(Tbasefrm)
    QRY_MEM: TMemo;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    qry: TADOQuery;
    DataSource1: TDataSource;
    LEDOFF: TImage;
    LEDON: TImage;
    Edit1: TEdit;
    LB: TListBox;
    SpeedButton3: TSpeedButton;
    MainMenu1: TMainMenu;
    ArquivosFiles1: TMenuItem;
    AbrirOpen1: TMenuItem;
    SalvarcomoSaveas1: TMenuItem;
    SalvarcomoSaveas2: TMenuItem;
    Label1: TLabel;
    SairQuit1: TMenuItem;
    AbrirBancodedadosOpenDataBase1: TMenuItem;
    Edit3: TEdit;
    trv_objetos: TTreeView;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    ADOConnection1: TADOConnection;
    adocomm: TADOCommand;
    adoset: TADODataSet;
    Panel2: TPanel;
    Edit2: TEdit;
    Edit4: TEdit;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure LBDblClick(Sender: TObject);
    procedure AbrirOpen1Click(Sender: TObject);
    procedure SalvarcomoSaveas2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairQuit1Click(Sender: TObject);
    procedure AbrirBancodedadosOpenDataBase1Click(Sender: TObject);
    procedure LBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure trv_objetosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trv_objetosDblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure trv_objetosClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure adosetFetchProgress(DataSet: TCustomADODataSet; Progress,
      MaxProgress: Integer; var EventStatus: TEventStatus);
    procedure FormClick(Sender: TObject);
    procedure QRY_MEMEnter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    
  private
    FADC: TAdoConnection;
    FDiretorio: string;
    FNome_banco: string;
    FTIPO: integer;
    procedure SetADC(const Value: TAdoConnection);
    procedure copia;
    procedure SetDiretorio(const Value: string);
    procedure SetNome_banco(const Value: string);
    procedure SetTIPO(const Value: integer);

    { Private declarations }
  public
    { Public declarations }
  property  ADC : TAdoConnection read FADC write SetADC;
  property Diretorio : string read FDiretorio write SetDiretorio;
  property Nome_banco : string read FNome_banco write SetNome_banco;
  property TIPO : integer read FTIPO write SetTIPO;  //indica se o treeviwe contém tabelas (10 ou atributo (2)
  procedure LoadConstantObj;override;
  end;

var
  frm_qry: Tfrm_qry;
  cancel_qry : boolean;
implementation

uses bst_treeAtiv, bst_dir4, bst_dir1, bst_bancos, bst_main, bstDB;

{$R *.dfm}

{ Tfrm_qry }

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end;


procedure Tfrm_qry.SetADC(const Value: TAdoConnection);
begin
  //FADC := Value;
end;

procedure Tfrm_qry.FormActivate(Sender: TObject);
begin
  inherited;

 // qry.Connection := adc;
  adocomm.Connection := adc;
  adoset.Connection := adc;
 // qry.ExecuteOptions := [eoAsyncExecute];
  If adc <> nil then
    Begin
      adc.Connected := true;
      LEDON.BringToFront;
    end
  else
     LEDOFF.BringToFront;
  
  edit1.Text := nome_banco;//frm_treeativ.Nome_banco;//.DefaultDatabase;
  diretorio := extractfileDir(application.ExeName);
  activeCOntrol := trv_objetos ;
end;

procedure Tfrm_qry.SpeedButton1Click(Sender: TObject);
var
qr : TstringList;
begin
  edit4.Text := '';
  qr := TStringList.create;
  If qry_mem.SelText = '' then
    qr.Text := qry_mem.Text
  else
    qr.Text := qry_mem.SelText;
 
  adoset.Close;
  
  with ADOset do
  begin
    CommandText := qr.Text;
    CommandType := cmdText;
    adoset.Open;
    application.ProcessMessages;
  end;

end;


procedure Tfrm_qry.SpeedButton3Click(Sender: TObject);
VAR
i : integer;
begin
  TIPO:= 1;
  trv_objetos.Items.Clear;
  ADC.GetTableNames(lb.items,false);
  for i := 0 to lb.Count - 1 do
    Begin
     trv_objetos.Items.Add(nil,lb.items[i])  ;
    end;
  label2.Caption := inttostr(trv_objetos.Items.count);  
end;

procedure Tfrm_qry.LBDblClick(Sender: TObject);
begin

 qry_mem.Lines.add('SELECT * FROM ' +uppercase(lb.Items[lb.itemindex]));

end;

procedure Tfrm_qry.copia;
Begin


    
end;

procedure Tfrm_qry.AbrirOpen1Click(Sender: TObject);
var
ExDir : string;
begin
  GetDir(@(ExDir));
  If ExDir <> '' then
   begin
         If ExtractFileExt(ExDir) <> '.sql' then
          ExDir := ExDir+'.sql' ;
         qry_mem.Lines.LoadFromFile(ExDir);
         //showmessage(mens43+ExDir);
   end;
 { If frm_dir4 = nil    then
    frm_dir4 := Tfrm_dir4.create(self);
  frm_dir4.fl.Mask := '*.sql';
  frm_dir4.dl.Directory := diretorio;
  frm_dir4.showmodal;
  If frm_treeativ.dir_db <> '' then
     qry_mem.lines.LoadFromFile(frm_treeativ.dir_db);  }
end;


procedure Tfrm_qry.SalvarcomoSaveas2Click(Sender: TObject);
var
ExDir : string;
begin
  GetDir(@(ExDir));
  If ExDir <> '' then
   begin
         If ExtractFileExt(ExDir) <> '.sql' then
          ExDir := ExDir+'.sql' ;
         qry_mem.Lines.SaveToFile(ExDir);
         //showmessage(mens43+ExDir);
   end;

 { If frm_diretorio = nil    then
    frm_diretorio := Tfrm_diretorio.create(self);
  frm_diretorio.dl.Directory := diretorio;
  frm_diretorio.showmodal;
  qry_mem.Lines.SaveToFile(frm_treeativ.ExportDir+'.sql'); }
end;

procedure Tfrm_qry.SetDiretorio(const Value: string);
begin
  FDiretorio := Value;
end;

procedure Tfrm_qry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If adc <> nil then
    adc.Connected := false;
  frm_qry := nil;
  action := caFree;
  
end;

procedure Tfrm_qry.SetNome_banco(const Value: string);
begin
  FNome_banco := Value;
end;

procedure Tfrm_qry.SairQuit1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_qry.AbrirBancodedadosOpenDataBase1Click(Sender: TObject);
begin
 trv_objetos.Items.Clear;
 If frm_bancos  = nil  then
   frm_bancos := Tfrm_bancos.create(self);
 frm_bancos.showmodal;

end;

procedure Tfrm_qry.LBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key=VK_UP) OR(Key=VK_DOWN) then
    exit
  else
  If (Key=VK_ESCAPE)  then
      edit3.text := ''
  else
  If (activeControl = lb) then
      begin
           // activecontrol := edit3;
            edit3.text    := char(key);
            edit3.SelStart :=1;;
      end;
end;

procedure Tfrm_qry.Edit3Change(Sender: TObject);
begin
 trv_objetos.selected := (locate_data(trv_objetos,edit3.Text) as TTreenode);
 activeControl := edit3;
end;

procedure Tfrm_qry.trv_objetosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key=VK_UP) OR(Key=VK_DOWN) then
    exit
  else
  If (Key=VK_ESCAPE)  then
      edit3.text := ''
  else
  If (activeControl = trv_objetos) then
      begin
           // activecontrol := edit3;
            edit3.text    := char(key);
            edit3.SelStart :=1;;
      end;
end;

procedure Tfrm_qry.trv_objetosDblClick(Sender: TObject);
begin
  If trv_objetos.Selected.Level = 0 then
    qry_mem.Lines.add('SELECT * FROM ' +uppercase(trv_objetos.Selected.Text))
  else
    qry_mem.Lines.add(uppercase(trv_objetos.Selected.Text)) ;
end;

procedure Tfrm_qry.DBGrid1TitleClick(Column: TColumn);
var
qr : TstringList;
cl : string;
begin
 // showmessage( COLUMN.FieldName);
 cl := column.FieldName;
   qry.close;
  qry.sql.Clear;
  qr := TStringList.create;
  If qry_mem.SelText = '' then
    qr.Text := qry_mem.Text
  else
    qr.Text := qry_mem.SelText;

  QRY.SQL.ADD(qr.text);

  qry.sql.Add(' ORDER BY '+''+cl+'');
 // showmessage(qry.sql.text);
  qry.open;
  activeCOntrol := trv_objetos ;
end;

procedure Tfrm_qry.trv_objetosClick(Sender: TObject);
var
i : integer;
iTab : Tdados_tab;
pCampo : string;
begin
lb.Clear;
  If Tipo = 1 then     //tabelas
    Begin
      iF TRV_OBJETOS.Selected.Level = 0 then
        Begin
          If not trv_objetos.Selected.HasChildren then
            Begin
              adc.GetFieldNames(trv_objetos.Selected.text,lb.items);

             for i := 0 to lb.Count - 1 do
               trv_objetos.Items.AddChild(trv_objetos.Selected,lb.items[i]) ;
            end;
          
        end;
    end
  else
  If Tipo = 2 then    //atributos
    Begin

      iF TRV_OBJETOS.Selected.Level = 0 then
        Begin
           If not trv_objetos.Selected.HasChildren then
             Begin
               iTab := Tdados_tab.create(self);
               itab.GetTab(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,trv_objetos.Selected.text) ;
               while not iTab.Eof do
                 Begin

                  If iTab.fieldbyname('idf_pk').asinteger > 0 then
                     pcampo := ' - PK('+iTab.fieldbyname('idf_pk').asstring+')';
                  trv_objetos.Items.AddChild(trv_objetos.Selected,iTab.fieldbyname('idf_tabela').asstring+ pCampo) ;
                  iTab.Next;
                 end;
             end;
           
        end;
    end  ;
  // trv_objetos.selected.Expand(true);

end;

procedure Tfrm_qry.SpeedButton2Click(Sender: TObject);
begin
  cancel_qry := true;
  edit4.Text := mens147;
 //  showmessage(mens147);

end;

procedure Tfrm_qry.adosetFetchProgress(DataSet: TCustomADODataSet;
  Progress, MaxProgress: Integer; var EventStatus: TEventStatus);
begin
  edit2.Text := inttostr(progress);
  //edit2.Repaint;
  If Cancel_qry then
     Begin
      dataset.Recordset.Cancel;
      cancel_qry := false;


      application.ProcessMessages;
     end;
end;

procedure Tfrm_qry.FormClick(Sender: TObject);
begin
  edit4.Text := '';
end;

procedure Tfrm_qry.QRY_MEMEnter(Sender: TObject);
begin
  edit4.Text := '';
end;

procedure Tfrm_qry.LoadConstantObj;
begin
  inherited;
  Caption              := 'SQL'  ;
  SpeedButton4.Caption := DEF32;//'aplicação dados'  ;
  SpeedButton3.Caption := DEFM4;//'Mostrar Tabelas'  ;
  SpeedButton1.Hint    := DEFE22;//'Executar/Run' ;
  SpeedButton1.Caption := DEFE22;//'Executar/Run'  ;
  Label1.Caption       := def88;//'Banco de dados/DataBase'   ;
  SpeedButton2.Caption := defc32;//'Cancelar'  ;
  
end;

procedure Tfrm_qry.SpeedButton4Click(Sender: TObject);
var
iTab : Tdados_tab;
pcampo,pCampo1,pCampoAnt : string;
begin
  inherited;
  Tipo := 2;
  trv_objetos.Items.Clear;
  iTab := Tdados_tab.create(self);
  itab.open_objetosByDesc(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'idf_dados') ;
  while not iTab.eof do
    Begin
     If uppercase(iTab.fieldbyname('idf_designacao').AsString) <> Uppercase(pCampoAnt) then

        Begin
          pCampo := '';
          
          trv_objetos.Items.Add(nil, iTab.fieldbyname('idf_designacao').AsString) ;
          pCampoAnt := iTab.fieldbyname('idf_designacao').AsString;
        end;

     
     iTab.next;
    end;
  label2.Caption := inttostr(trv_objetos.Items.count);
end;

procedure Tfrm_qry.SetTIPO(const Value: integer);
begin
  FTIPO := Value;
end;

end.
