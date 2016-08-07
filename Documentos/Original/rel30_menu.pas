unit rel30_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons,cls_bd,bstdb, StdCtrls,fonctions;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    qry_cria_idf_dados: TADOQuery;
    QRY_CRIAiNDEX: TADOQuery;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Memo1: TMemo;
    lb: TMemo;
    SpeedButton6: TSpeedButton;
    GroupBox1: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    CHK3: TCheckBox;
    chk4: TCheckBox;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    adoc: TADOConnection;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses bst_treeAtiv;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  try
      begin
        If bdx = nil then
           bdx := TBd.create(false);
      end;
     except
      begin
         freeandnil(bdx);
         raise;
         showmessage('Não foi possível abrir o Banco de dados!'+#13+'Verificar as Configurações!');
      end;
     end;
     qry_cria_idf_dados.Connection := bdx; 
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  qry_CRia_idf_dados.Connection := BDX;
  QRY_CRIAiNDEX.Connection := BDX;
  qry_CRia_idf_dados.ExecSQL;
  QRY_CRIAiNDEX.execsql;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
   freeandnil(BDx);
  BDx := TBD.Create(true);
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  QRY_CRIAiNDEX.Connection := BDX;
  QRY_CRIAiNDEX.execsql;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
   with qry_cria_Idf_dados do
    Begin
     close;
     Connection := BDX;
     sql.clear;
     sql.add('ALTER TABLE IDF_DADOS ');
     sql.add('ADD IDF_CAPTION VARCHAR(40) ,');
     sql.add('IDF_OBRIG VARCHAR(1) ');
     execsql;
    end;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
var
i : integer;
iTab,iFld : TstringList;
begin
  // cria atributo lck
  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;


   adoc.GetTableNames(lb.lines,false);

   for i := 0 to lb.LINES.count - 1 do
    Begin
       adoc.GetFieldNames(lb.lines[i],ifld);
       If not Inlist('LCK',iFld) then
       with qry_cria_Idf_dados do
         Begin
           close;
           Connection := BDX;
           sql.clear;
           sql.add('ALTER TABLE '+''+lb.lines[i]+'');
           sql.add('ADD LCK VARCHAR(1) ');
           execsql;
          end;
    end;


end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
var
iTab,iFld : TstringList;
i : integer;
begin
  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;
  qry_cria_Idf_dados.Connection := BDX;

 If InList('PROVIDER_DATA',itab) then
  Begin
     adoc.GetFieldNames('PROVIDER_DATA',ifld);
     If not Inlist('TIPO',iFld) then
       Begin
         with qry_cria_Idf_dados do
          Begin
           close;
           Connection := BDX;
           sql.clear;
           sql.add('ALTER TABLE PROVIDER_DATA ');
           sql.add('ADD TIPO VARCHAR(1)');
           execsql;
          end;
       end   ;
  end;



 adoc.GetTableNames(itab,false);


 If not InList('PROVIDER_DATA',itab) then
  Begin
    with qry_cria_Idf_dados do
    Begin
     close;
     sql.clear;
     sql.add('CREATE TABLE PROVIDER_DATA (PROVIDER VARCHAR(50),TYPE_NAME VARCHAR(60) ,');
     sql.add('DATA_TYPE INTEGER ,COLUMN_SIZE INTEGER ,TIPO VARCHAR(1),LCK VARCHAR(50))');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
    // Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'C'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;



    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'I'+''''+',') ;
     sql.add(''''+'I'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'N'+''''+',') ;
     sql.add(''''+'N'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'M'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'D'+''''+',') ;
     sql.add(''''+'D'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
 //   Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'T'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;
 end;


   adoc.GetFieldNames('IDF_AP',ifld);

   If bdx.TIPOBANCO <> 1 then
    begin
      with qry_cria_Idf_dados do
        Begin
         close;

          If Inlist('IDF_ID_FISICO',iFld) then
          begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('DROP IDF_ID_FISICO,');
             sql.add(' IDF_ACAO_CORRETIVA,');
             sql.add(' IDF_ACTOR_ROLE,');
             sql.add(' IDF_ALVOS_MELHORIA,');
             sql.add(' IDF_BUSSINESS_OWNER,');
             sql.add(' IDF_CARACTER_RELEVANTES,');
             sql.add(' IDF_CARGO,');
             sql.add(' IDF_CONSTRAINT_NAME,');
             sql.add(' IDF_DATA_TYPE,');
             sql.add(' IDF_DEFAULT_VALUE,');
             sql.add(' IDF_DIAGRAM_STATUS,');
             sql.add(' IDF_DOMINIO,');
             sql.add(' IDF_EFETIVO_DA_CLASSE,');
             sql.add(' IDF_EQUIPE_PROJETO,');
             sql.add(' IDF_ESTADO,');
             sql.add(' IDF_EXPECTATIVAS_GANHO,');
             sql.add(' IDF_FATORES_RESTRITIVOS,');
             sql.add(' IDF_IDENTIFYING,');
             sql.add(' IDF_JORNADA_PADRAO,');
             sql.add(' IDF_LOCALIZACAO_FISICA,');
             sql.add(' IDF_MINIESPECIFICACAO,');
             sql.add(' IDF_NAMING_PREFIX,');
             sql.add(' IDF_NORMALIZE,');
             sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
             sql.add(' IDF_PONTO_DE_VISTA,');
             sql.add(' IDF_PRE_REQUISITOS,');
             sql.add(' IDF_PROJECT,');
             sql.add(' IDF_QUANTIDADE_TURNOS,');
             sql.add(' IDF_REVERSE_PHRASE,');
             sql.add(' IDF_ROLE,');
             sql.add(' IDF_ROLE_PREFIX,');
             sql.add(' IDF_TYPE_QUALIFIERS,');
             sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
             sql.add(' IDF_REGRA_EXCECAO,');
             sql.add(' IDF_DATABASE,');
             sql.add(' IDF_DBDIR,');
             sql.add(' IDF_DBTYPE,');
             sql.add(' IDF_SYSTEMTABLE,');
             sql.add(' IDF_TIPO__ASPECTO,');
             sql.add(' IDF_ASPECTOS_CRITICOS,');
             sql.add(' IDF_COND_TRABALHO,');
             sql.add(' IDF_FORMACAO,');
             sql.add(' IDF_CONHECIMENTO,');
             sql.add(' IDF_EXPERIENCA,');
             sql.add(' IDF_COMPETENCIA,');
             sql.add(' ARI_ID,');
             sql.add(' IDF_ADERENCIA,');
             sql.add(' IDF_ATIVIDADE_CONTEXTO,');
             sql.add(' IDF_CARGA_HORA_DEMANDADA,');
             sql.add(' IDF_CLASSEOBJETO,');
             sql.add(' IDF_CLASSIFICACAO_PP,');
             sql.add(' IDF_COMPLEXIDADE,');
             sql.add(' IDF_CUSTO_ANUAL,');
             sql.add(' IDF_DEFINICAO_CONTEXTO,');
             sql.add(' IDF_DISTRIBUICAO,');
             sql.add(' IDF_EFEITO,');
             sql.add(' IDF_ESPECIALIZACAO,');
             sql.add(' IDF_FORMALIZACAO,');
             sql.add(' IDF_FUNCAO_NIVEL,');
             sql.add(' IDF_LOGICA,');
             sql.add(' IDF_MEDIA,');
             sql.add(' IDF_NOME,');
             sql.add(' IDF_OBJETIVO_PROCESSO,');
             sql.add(' IDF_PERIODICIDADE,');
             sql.add(' IDF_PREMISSAS,');
             sql.add(' IDF_PRIORIDADE,');
             sql.add(' IDF_QTDE_NECES_PROCES,');
             sql.add(' IDF_SIGLA,');
             sql.add(' IDF_SITUACAO,');
             sql.add(' IDF_TEMPO_CONTRATACAO,');
             sql.add(' IDF_TIMING');
             execsql;
           end;
        end;
    end
   else
    begin
     If Inlist('IDF_ID_FISICO',iFld) then
      begin
        with qry_cria_Idf_dados do
        Begin
         close;

        // Connection := BDX;
         sql.clear;
         sql.add('ALTER TABLE IDF_AP ');
         sql.add('DROP COLUMN IDF_ID_FISICO,');
         sql.add(' IDF_ACAO_CORRETIVA,');
         sql.add(' IDF_ACTOR_ROLE,');
         sql.add(' IDF_ALVOS_MELHORIA,');
         sql.add(' IDF_BUSSINESS_OWNER,');
         sql.add(' IDF_CARACTER_RELEVANTES,');
         sql.add(' IDF_CARGO,');
         sql.add(' IDF_CONSTRAINT_NAME,');
         sql.add(' IDF_DATA_TYPE,');
         sql.add(' IDF_DEFAULT_VALUE,');
         sql.add(' IDF_DIAGRAM_STATUS,');
         sql.add(' IDF_DOMINIO,');
         sql.add(' IDF_EFETIVO_DA_CLASSE,');
         sql.add(' IDF_EQUIPE_PROJETO,');
         sql.add(' IDF_ESTADO,');
         sql.add(' IDF_EXPECTATIVAS_GANHO,');
         sql.add(' IDF_FATORES_RESTRITIVOS,');
         sql.add(' IDF_IDENTIFYING,');
         sql.add(' IDF_JORNADA_PADRAO,');
         sql.add(' IDF_LOCALIZACAO_FISICA,');
         sql.add(' IDF_MINIESPECIFICACAO,');
         sql.add(' IDF_NAMING_PREFIX,');
         sql.add(' IDF_NORMALIZE,');
         sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
         sql.add(' IDF_PONTO_DE_VISTA,');
         sql.add(' IDF_PRE_REQUISITOS,');
         sql.add(' IDF_PROJECT,');
         sql.add(' IDF_QUANTIDADE_TURNOS,');
         sql.add(' IDF_REVERSE_PHRASE,');
         sql.add(' IDF_ROLE,');
         sql.add(' IDF_ROLE_PREFIX,');
         sql.add(' IDF_TYPE_QUALIFIERS,');
         sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
         sql.add(' IDF_REGRA_EXCECAO,');
         sql.add(' IDF_DATABASE,');
         sql.add(' IDF_DBDIR,');
         sql.add(' IDF_DBTYPE,');
         sql.add(' IDF_SYSTEMTABLE,');
         sql.add(' IDF_TIPO__ASPECTO,');
         sql.add(' IDF_ASPECTOS_CRITICOS,');
         sql.add(' IDF_COND_TRABALHO,');
         sql.add(' IDF_FORMACAO,');
         sql.add(' IDF_CONHECIMENTO,');
         sql.add(' IDF_EXPERIENCA,');
         sql.add(' IDF_COMPETENCIA,');
         sql.add(' ARI_ID,');
         sql.add(' IDF_ADERENCIA,');
         sql.add(' IDF_ATIVIDADE_CONTEXTO,');
         sql.add(' IDF_CARGA_HORA_DEMANDADA,');
         sql.add(' IDF_CLASSEOBJETO,');
         sql.add(' IDF_CLASSIFICACAO_PP,');
         sql.add(' IDF_COMPLEXIDADE,');
         sql.add(' IDF_CUSTO_ANUAL,');
         sql.add(' IDF_DEFINICAO_CONTEXTO,');
         sql.add(' IDF_DISTRIBUICAO,');
         sql.add(' IDF_EFEITO,');
         sql.add(' IDF_ESPECIALIZACAO,');
         sql.add(' IDF_FORMALIZACAO,');
         sql.add(' IDF_FUNCAO_NIVEL,');
         sql.add(' IDF_LOGICA,');
         sql.add(' IDF_MEDIA,');
         sql.add(' IDF_NOME,');
         sql.add(' IDF_OBJETIVO_PROCESSO,');
         sql.add(' IDF_PERIODICIDADE,');
         sql.add(' IDF_PREMISSAS,');
         sql.add(' IDF_PRIORIDADE,');
         sql.add(' IDF_QTDE_NECES_PROCES,');
         sql.add(' IDF_SIGLA,');
         sql.add(' IDF_SITUACAO,');
         sql.add(' IDF_TEMPO_CONTRATACAO,');
         sql.add(' IDF_TIMING');
         execsql;
       end ;
      end;
     end;


end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
   with qry_cria_Idf_dados do
    Begin
     close;
     Connection := BDX;


       sql.clear;
       sql.add('ALTER TABLE COR_OBJETOS ');
       sql.add('ADD ATOR_CATEGORIA VARCHAR(25) NULL');
       execsql;

       sql.clear;
       sql.add('ALTER TABLE IDF_AC ');
       sql.add('ADD DIMENSAO VARCHAR(25) NULL');
       execsql;
     end; 


end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
var
iTab,iFld : TstringList;
i : integer;
begin
  SpeedButton6Click(nil);
//  SpeedButton5Click(nil); //atributos lck
  
  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;


   begin
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
         //tabela de custos  atividade
      If not InList('IDF_CUSTOS',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_CUSTOS( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER)');
                 execsql ;
              end
             else
              Begin
                sql.add('CREATE TABLE IDF_CUSTOS( ');
                 sql.add('CLI_ID LONG,PRJ_ID LONG,IDG_ID LONG  ,IDF_CODIGO LONG)');
                 execsql ;
              end;
           end;
      end;

        //tabela de custos  dos últiomos dg
      If not InList('IDF_CUSTODG',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_CUSTODG( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER,');
                 sql.add('IDF_CUSTO_MO FLOAT,IDF_CUSTO_TEC FLOAT,IDF_CUSTO_GERAL FLOAT,IDF_CUSTO_MP FLOAT)');
                 execsql ;
              end
             else
              Begin
                sql.add('CREATE TABLE IDF_CUSTODG( ');
                sql.add('CLI_ID LONG,PRJ_ID LONG,IDG_ID LONG  ,IDF_CODIGO LONG,');
                sql.add('IDF_CUSTO_MO FLOAT,IDF_CUSTO_TEC FLOAT,IDF_CUSTO_GERAL FLOAT,IDF_CUSTO_MP FLOAT)');
                execsql ;
              end;
           end;
      end
      else
       Begin
          adoc.GetFieldNames('IDF_CUSTODG',ifld);
          If not Inlist('IDF_CUSTO_MP',iFld) then
            Begin
               with qry_cria_Idf_dados do
                Begin
                   sql.clear;
                   sql.add('ALTER TABLE IDF_CUSTODG ');
                   sql.add('ADD IDF_CUSTO_MP FLOAT NULL');
                   execsql;
                end;

            end;
       end;

      If not InList('CUSTO_TEMP',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE CUSTO_TEMP( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,SUB_NOME varchar(50),IDF_CODIGO INTEGER,IDF_TIPO_ATIVIDADE VARCHAR(16), ');
                 sql.add(' IDF_DESIGNACAO VARCHAR(50),OBS VARCHAR(100))');
                 execsql ;
              end
             ELSE
              Begin
                sql.add('CREATE TABLE CUSTO_TEMP( ');
                sql.add('CLI_ID LONG,PRJ_ID INTEGER,IDG_ID LONG  ,SUB_NOME varchar(50),IDF_CODIGO INTEGER,IDF_TIPO_ATIVIDADE VARCHAR(16), ');
                sql.add(' IDF_DESIGNACAO VARCHAR(50),OBS VARCHAR(100))');
                execsql ;
              end;


            end;
       end;

      //tabela IDF_DADOS
      If InList('IDF_DADOS',itab) then
       Begin
           adoc.GetFieldNames('IDF_DADOS',ifld);
           If not Inlist('IDF_CAPTION',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_DADOS ');
               sql.add('ADD IDF_CAPTION VARCHAR(40) ,');
               sql.add('IDF_OBRIG VARCHAR(1) ');
               execsql;
              end;
           end;
       end;


       If not InList('IDF_DADOS',itab) then
        Begin
          If bdx.TIPOBANCO = 1 then    //SQL
           Begin
           with qry_cria_Idf_dados do
            Begin
              close;
               sql.clear;
              sql.add('CREATE TABLE IDF_DADOS(   ');
              sql.add('IDF_CODIGO INTEGER   , ');
              sql.add('CLI_ID INTEGER  ,     ');
              sql.add('PRJ_ID INTEGER  ,     ');
              sql.add('IDF_TABELA varchar (60)  ,    ');
              sql.add('IDF_DESIGNACAO varchar (50)   , ');
              sql.add('SUB_NIVEL LONG  ,              ');
              sql.add('IDF_NOME varchar (60)   ,      ');
              sql.add('IDF_DEL varchar (1)  ,        ');
              sql.add('IDF_VISIBLE varchar (1)  ,     ');
              sql.add('IDF_DESCRICAO LONGTEXT  ,      ');
              sql.add('IDF_DATA_TYPE varchar (60)   , ');
              sql.add('IDF_DEFAULT_VALUE varchar (20)   , ');
              sql.add('IDF_DOMINIO text    ,            ');
              sql.add('IDF_NAMING_PREFIX varchar (8)   , ');
              sql.add('IDF_NATUREZA varchar (50)   ,  ');
              sql.add('IDF_NORMALIZE varchar (1)   ,    ');
              sql.add('IDF_TYPE_QUALIFIERS varchar (20)   , ');
              sql.add('IDF_DE_REPET LONG  ,           ');
              sql.add('IDF_PK INTEGER  ,                   ');
              sql.add('IDF_SEQ INTEGER  ,                ');
              sql.add('IDF_CAPTION varchar (40)   ,   ');
              sql.add('IDF_OBRIG varchar (1)  ,       ');
              sql.add('LCK varchar  (1) )            ');
              execsql;
            end;

           end
        else
          Begin
           with qry_cria_Idf_dados do
            Begin
              close;
               sql.clear;
              sql.add('CREATE TABLE IDF_DADOS(   ');
              sql.add('IDF_CODIGO LONG   , ');
              sql.add('CLI_ID LONG  ,     ');
              sql.add('PRJ_ID LONG  ,       ');
              sql.add('IDF_TABELA varchar (60)  ,    ');
              sql.add('IDF_DESIGNACAO varchar (50)   , ');
              sql.add('SUB_NIVEL LONG  ,              ');
              sql.add('IDF_NOME varchar (60)   ,      ');
              sql.add('IDF_DEL varchar (1)  ,        ');
              sql.add('IDF_VISIBLE varchar (1)  ,     ');
              sql.add('IDF_DESCRICAO LONGTEXT  ,      ');
              sql.add('IDF_DATA_TYPE varchar (60)   , ');
              sql.add('IDF_DEFAULT_VALUE varchar (20)   , ');
              sql.add('IDF_DOMINIO text    ,            ');
              sql.add('IDF_NAMING_PREFIX varchar (8)   , ');
              sql.add('IDF_NATUREZA varchar (50)   ,  ');
              sql.add('IDF_NORMALIZE varchar (1)   ,    ');
              sql.add('IDF_TYPE_QUALIFIERS varchar (20)   , ');
              sql.add('IDF_DE_REPET LONG  ,           ');
              sql.add('IDF_PK LONG  ,                   ');
              sql.add('IDF_SEQ LONG  ,                ');
              sql.add('IDF_CAPTION varchar (40)   ,   ');
              sql.add('IDF_OBRIG varchar (1)  ,       ');
              sql.add('LCK varchar  (1) )            ');
              //SQL.SaveToFile('C:\SQL.TXT');
              execsql;
            end;

           end;

        end;

        //tabela IDF_APLICATIVO
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
      If not InList('IDF_TX',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_TX( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDF_CODIGO integer  ,IDF_DESIGNACAO varchar(50),');
                 sql.add('IDF_OBJETIVO varchar(50), IDF_BD varchar(30),IDF_FORNECEDOR varchar(50),');
                 sql.add(' IDF_IMPLANTACAO DATETIME,IDF_CUSTO_LIC FLOAT,IDF_CUSTO_MANUT FLOAT,IDF_CUSTO_OUTROS FLOAT,');
                 SQL.ADD('IDF_TIPO_ATIVIDADE VARCHAR(16),IDF_VISIBLE VARCHAR(1),IDF_DEL VARCHAR(1),IDG_ID INTEGER,');
                 sql.add('LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATETIME,IDF_RESPONSAVEL VARCHAR(30))');
                 execsql ;
              end
             ELSE
              Begin
                sql.add('CREATE TABLE IDF_TX( ');
                 sql.add('CLI_ID LONG,PRJ_ID INTEGER,IDF_CODIGO integer  ,IDF_DESIGNACAO varchar(50),');
                 sql.add('IDF_OBJETIVO varchar(50), IDF_BD varchar(30),IDF_FORNECEDOR varchar(50),');
                 sql.add(' IDF_IMPLANTACAO DATE,IDF_CUSTO_LIC FLOAT,IDF_CUSTO_MANUT FLOAT,IDF_CUSTO_OUTROS FLOAT,');
                 SQL.ADD('IDF_TIPO_ATIVIDADE VARCHAR(16),IDF_VISIBLE VARCHAR(1),IDF_DEL VARCHAR(1),IDG_ID INTEGER,');
                 sql.add('LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATE,IDF_RESPONSAVEL VARCHAR(30))');

                 execsql ;
              end;


            end;
       end;

          //tabela LIMPA
       adoc.GetFieldNames('IDF_LIMPA',ifld);
        begin
         If bdx.TIPOBANCO = 0 then
          Begin
            with qry_cria_Idf_dados do
            BEGIN
               Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_LIMPA');
                 sql.add('DROP DESIGNACAO');
                 execsql;
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_LIMPA');
                 sql.add('ADD DESIGNACAO VARCHAR(255)');
                 execsql;
                end;
            end;
          end
         else
         Begin
            with qry_cria_Idf_dados do    //SQL
            BEGIN
               Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_LIMPA');
                 sql.add('DROP COLUMN DESIGNACAO');
                 execsql;
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_LIMPA');
                 sql.add('ADD DESIGNACAO VARCHAR(255)');
                 execsql;
                end;
            end;
          end;
       end;

        //tabela PROJETOS
       adoc.GetFieldNames('PRJ_PROJETO',ifld);
        begin
          with qry_cria_Idf_dados do
            BEGIN
              If not Inlist('PRJ_CAMINHO',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE PRJ_PROJETO');
                 sql.add('ADD PRJ_CAMINHO VARCHAR(60)');
                 execsql;

                end;
              If not Inlist('IDF_DIRETORIO',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE PRJ_PROJETO');
                 sql.add('ADD IDF_DIRETORIO VARCHAR(250)');
                 execsql;

                end;
            end;
       end;

       //tabela COR_OBJETOS
       adoc.GetFieldNames('COR_OBJETOS',ifld);

         with qry_cria_Idf_dados do
          begin
           If not Inlist('PERC_CUSTO',iFld) then
            Begin

               sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD PERC_CUSTO INTEGER NULL');
               execsql;
            end;
           If not Inlist('PERC_CODIGO',iFld) then
            Begin
                sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD PERC_CODIGO INTEGER NULL');
               execsql;
            end;
           If not Inlist('ATOR_CATEGORIA',iFld) then
            Begin
                sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD ATOR_CATEGORIA VARCHAR(25) NULL');
               execsql;
            end;

         //tabela informações
         adoc.GetFieldNames('IDF_IF',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_IF ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

        //tabela pessoas
         adoc.GetFieldNames('IDF_OI',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_OI ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
        //tabela pessoas
         adoc.GetFieldNames('IDF_PS',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_PS ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
        //tabela LOCAIS
         adoc.GetFieldNames('IDF_LF',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_LF ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
        //tabela eventos de negócio
         adoc.GetFieldNames('IDF_EN',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_EN ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
       //tabela fluxos de dados
         adoc.GetFieldNames('IDF_DG',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_DG ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

         //tabela regras de negócio
         adoc.GetFieldNames('IDF_RN',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_RN ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         //tabela rsistemas
         adoc.GetFieldNames('IDF_SE',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_SE ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

         //tabela aplicativos
         adoc.GetFieldNames('IDF_TX',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_TX ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         //tabela ASPECTOS CRITICOS
         adoc.GetFieldNames('IDF_AC',ifld);
         If not Inlist('DIMENSAO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AC ');
             sql.add('ADD DIMENSAO VARCHAR(25) NULL');
             execsql;
           end;
         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AC ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;


         //tabela ator
         adoc.GetFieldNames('IDF_CA',ifld);
         If not Inlist('IDF_JORNADA_ANUAL',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_CA ');
             sql.add('ADD IDF_JORNADA_ANUAL FLOAT NULL');
             execsql;
           end;
        If not Inlist('IDF_CUSTO_ANUAL',iFld) then
         Begin
           sql.clear;
           sql.add('ALTER TABLE IDF_CA ');
           sql.add('ADD IDF_CUSTO_ANUAL FLOAT NULL');
           execsql;
         end;

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_CA ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

           //tabela IDF_SE
         adoc.GetFieldNames('IDF_SE',ifld);
         If not Inlist('IDF_CUSTO_TEC',iFld) then
           Begin

             sql.clear;
             sql.add('ALTER TABLE IDF_SE ');
             sql.add('ADD IDF_CUSTO_TEC FLOAT NULL');
             execsql;
           end;


              //tabela IDF_AP
         adoc.GetFieldNames('IDF_AP',ifld);
         If not Inlist('IDF_CUSTO_TEC',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_TEC FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_ANUAL',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_ANUAL FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_GERAL',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_GERAL FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_MP',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_MP FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         end;

        //tabela IDF_SE

         adoc.GetFieldNames('IDF_SE',ifld);


         If not Inlist('IDF_COD_APLIC',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_SE ');
               sql.add('ADD IDF_COD_APLIC INTEGER NULL');
               execsql;
              end;

           end;

        //tabela IDF_LF

         adoc.GetFieldNames('IDF_LF',ifld);


         If not Inlist('IDF_CUSTOAMBIENTE',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_LF ');
               sql.add('ADD IDF_CUSTOAMBIENTE FLOAT NULL');
               execsql;
              end;

           end;
    end;
end;

end.
