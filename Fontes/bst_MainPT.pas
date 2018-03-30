unit bst_MainPT;


interface

uses Windows,Menus,dialogs;

function fMainMenuPT (Menu : TMainMenu) : TMainMenu;
function fResPT : boolean;    //carregar todos os strings (constantes)
function fTreeAtivPopnodePT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup PopNode
function fTreeAtivEntPopePT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup EntPop - TreeAtiv
function fTreeAtivPopLinkPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup PopLink - TreeAtiv
function fTreeAtivPopLivPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup FreeDiagram - TreeAtiv
function fObjPopUpPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup do TelaObj
function fQueryPT (Menu : TMainMenu) : TMainMenu;  //menu Qury



const cMainPT : array [0..7] of string   = ('Tabelas','Dimens�es','Repositorios','Ferramentas','Seguran�a','Relat�rios','Ajuda','Exit');
const cMainPT0 : array [0..2] of string  = ('Empresas','Areas de Interesse','Dominios');
const cMainPT1 : array [0..11] of string = ('Atividades','Eventos de Neg�cio','-','Regras de Neg�cio','-','Recursos Humanos','-','Tecnologia','Informa��es','Meio Ambiente','-','Aspectos Cr�ticos e Alvos de Melhoria');
const cMainPT15 : array [0..1] of string = ('Classes de Atores','Pessoas');
const cMainPT17 : array [0..3] of string = ('Objeto de Interface','Objeto de Controle','Mecanismos','Softwares');
const cMainPT18 : array [0..2] of string = ('Fluxos de Dados','Elementos de Dado','Objetos de Neg�cio');
const cMainPT19 : array [0..0] of string = ('Locais de Processamento');
const cMainPT3 : array [0..5] of string  = ('Compress�o do Banco','Verifica��o de Diagramas','Configura��o de Objetos','Integra��o de Diagramas','Exporta��o de Diagramas','Idiomas');
const cMainPT35 : array [0..2] of string = ('Portugu�s','English','Fran�ais');
const cMainPT51 : array [0..3] of string = ('Usu�rios','Pessoas','Casos de Uso','Privil�gios');
const cMainPT4 : array [0..20] of string = ('Atividades',
         'Aspectos Cr�ticos',
         'Alvos de melhoria',
         'Regras de Neg�cio',
         'Atores',
         'Pessoas',
         'Eventos de Neg�cio' ,
         'Fluxos de dados',
         'Locais de Processamento',
         'Entidades Externas',
         'Ator x Atividade',
         '-',
         'Objetos de Interface',
         'Objetos de Controle',
         'Objetos de Neg�cio',
         'Atividades x Objetos de Interface' ,
         'Elementos de dado',
         'Aplica��o dos Dados' ,
         'Mecanismos',
         'Ator x Pessoa',         'Atividade x Tecnologia');
 cMainPt5 : array [0..3] of string = ('Ajuda','Sobre BEST','-','Configura��o Atual');

 ///menus Treeativ

const cTreeAtivPopnodePT : array [0..20] of string = ('Lista','-','Novo/Abrir','Executar','Imagem','Propriedades','-','Atr�s','Frente','-',
                                                      'Registrar Aspectos Cr�ticos/Melhorias','-','N�vel Abaixo','Imprimir Objetos','-',
                                                      'Gerar Script SQL','Imprimir Miss�o Ator','Gerar Casos de Uso','-',
                                                      'Importar Digramas','Mostrar Dados');
const cTreeAtivPopNodePT4 : array [0..3] of string = ('Incluir Imagem','Excluir Imagem','Ajustar Imagem � Entidade','Ajustar Entidade � Imagem');

const cTreeAtivEntPopPT : array [0..13] of string  = ('Propriedades','Selecionar Tudo','Atualizar Descri��o dos Objetos','-',
                                                      'Registrar Aspectos Cr�ticos/Melhorias','Aspectos Cr�ticos','-',
                                                      'Tela Cheia','-','N�vel Acima','-','Valores Default','-','Registrar Pend�ncias');
const cTreeAtivPopLinkPT : array [0..6] of string  = ('Lista','-','Ajustar Linha','Est�mulo','Propriedades','-','Esconde/Mostra Fluxo');

const cTreeAtivPopLivPT : array [0..3] of string   = ('Atr�s','Frente','Imagem','Propriedades');

const cObjPopupPT : array [0..1] of string         = ('Excluir da Lista','Eliminar Elemento de Dados');

const cQueryPT : array [0..1] of string            = ('Queries','Sair');
const cQueryPT1 : array [0..3] of string           = ('Abrir','Salvar como','Abrir Banco','Sair');


resourcestring
  dimPT1       = 'Processos de Neg�cio';
  dimPT2       = 'Diagrama de An�lise' ;
  dimPT3       = 'Modelo de Informa��o';
  dimPT4       = 'Estrutura Organizacional';
  dimPT5       = 'Livre';
  dimPT6       = 'Diagrama de Classes';

  defPT3800    = '1 para n'     ;
  defPT3802    = '0,1 para n'   ;
  defPT3803    = '1,n para n'   ;
  defPT1opt    = '1 Opcional'  ;
  defPT12n     = '1 para n'  ;

  defPT3804    = '0,1 PARA 1'   ;
  defPT3805    = '0,1 PARA 1,N' ;
  defPT3806    = '1,PARA 1,N'   ;
  defPT3807    = '1 PARA 1'     ;
  defPT3808    = '1 PARA 0,1'   ;



  //A
  defPTa25     =   'Aberto';
  defPT97      =   'Abrir';
  defpta14     =   'Abrir Planilha ap�s gerar'    ;
  defpta26     =   'Acesso';
  defPTa6      =   'A��o Corretiva'  ;
  defPTa7      =   'A��o Corretiva'  ;
  defPT970     =   'Ader�ncia';
  defPT38      =   ' Afetado(a)(s)';
  defPTd7      =   'Afetadas'     ;
  defPT38001   =   'Agrega��o'   ;
  defPT385     =   'Ajustar Diagrama'        ;
  defpta13     =   'Ajustar � p�gina' ;
  defPTa12     =   'Alinhamento'       ;
  defPT381     =   'Alinhar a Direita'       ;
  defPT382     =   'Alinhar acima'           ;
  defPT383     =   'Alinhar abaixo'          ;
  defPT384     =   'Alinhar a esquerda (E)'  ;
  defPTa18     =   'Alinha centros horizontalmente (H)'  ;
  defPTa19     =   'Alinha Centros Verticalmente' ;


  defPT380     =   'Alternate';
  defPTa2      =   'Alvo de Melhoria';
  defPTa3      =   '';//'Aplica��o'  ;
  defPTa10     =   'Ambos'     ;
  defPTa15     =   'Ano'   ;
  defPTa11     =   'Aplicar'  ;
  defPTa1      =   'Atributos'  ;
  defPTa4      =   'Alocar Dimens�o'  ;
  defPTa16     =   'Altura';
  defPTa17     =   'Alinha ao grid ';
  defPTa27     =   'Alterar Senha' ;
  defPT3801    =   'Analisando Diagrama ';
  defPT32      =   'Aplica��o dos Dados';
  defPTA8      =   'Aplicar ao Diagrama Corrente'  ;
  defPT321     =   'Aplicativos';
  defPTa9      =   'Aprova��o';
  defPT3211    =   'Areas de Interesse';
  defPT103     =   'Arquivo';
  defPT40      =   'Aspecto Cr�tico';
  defPT3841    =   'Association'             ;
  defPT63      =   'Atividade';
  defPT56      =   'Atividades Disparadas';
  defPT61      =   'Atividades onde Aplicada';
  defPT34      =   'ATIVIDADES X OBJETOS DE INTERFACE';
  defPT108     =   'ATIVIDADES';
  defPT106     =   'Atividades';
  defPT340     =   'Atividade Procedural';
  defPT10      =   'Atores';
  defPT1000    =   'Ator';
  defPT10000   =   'Ator Envolvido';
  defPT10001   =   'Ator x Atividades';
  defPT10004   =   'Ator/Local de Processamento default';
  defPT7610    =   'Atributos de Fluxos'  ;
  defPT7611    =   'Atributos de Objetos de Neg�cio'  ;
  defPT10002   =   'Atualiza nomes de Atividades e Fluxos de Dados'     ;
  defPT10003   =   'Aumentar'  ;
  defPT100030  =   'Autom�tico'  ;
  defPT10006   =   'Avalia��o'     ;
  


  //B
  defPT88      =   'Banco de Dados ';
  defPT902     =   'BEST - Registro' ;

  //C
  defPTc32     =   'Cancelar';
  defPTc8      =   'Cargo';
  defPT882     =   'Categoria ';
  defPT8821    =   'Causa da Inatividade'  ;
  MensaspPT1   =   'Causa';
  defPT883     =   'Categoria Ator ';
  defPTc9      =   'Celular';
  defPT881     =   'Cen�rios';
  defPTc16     =   'Cen�rio   :'  ;
  defptc29     =   'Cen�rios Origem' ;
  defptc30     =   'Cen�rios Destino' ;
  defPTc11     =   'Cliente'      ;
  defPT510     =   'Colar';
  defPT28      =   'Colocar o programa ';
  defPTc15     =   'Compacta��o' ;
  defPTc3      =   'Compet�ncia Intelectual';
  defPTc7      =   'Complexidade'  ;
  defptc31     =   'Concluir' ;
  defPT280     =   'Condicional ';
  defPTc4      =   'Condi��es de Trabalho ';
  defPTc17     =   'Configura��es Padr�o dos Objetos'  ;
  defPTc36     =   'Informa��o'  ;
  defptC37     =   'Confirma��o ' ;
  defPTc12     =   'Consulta ';
  defPT1240    =   'Controle' ;
  defPT20      =   'Controle';
  defPTc6      =   'Contingencias';
  defPT23      =   'Classe ';
  defPT233     =   'Classes';
  defPT51      =   'Classe de Atores';
  defPTc2      =   'Classe de Pessoas';
  defPT77      =   'Consistir Diagrama';
  defPTc33     =   'Consist�ncia de Diagrama';
  defPT777     =   'Confirma a Exporta��o ?';
  defPT7779    =   'Conector';
  defPT77779   =   'Conex�o';
  defPT777779  =   'Conex�o de Regra de Neg�cio';
  defPT7771    =   'Conector Inv�lido ap�s atividade ';
  defPT7775    =   'Reposit�rio' ;
  defPT7776    =   'Configura��o de Reposit�rios'  ;
  defPT7777    =   'Configura��o dos Objetos' ;
  defPTc19     =   'Centralizado - topo'     ;
  defPTc20     =   'Centralizado - meio'     ;
  defPTc21     =   'Centralizado - abaixo';
  defPTc26     =   'C�rculo Cheio'   ;
  defPTc27     =   'C�rculo Vazio'    ;
  defPTc22     =   'Cores'  ;
  defPTc28     =   'Cor do Tra�o'  ;
  defPTc23     =   'Cor da Borda'  ;
  defPTc24     =   'Cor do Fundo'   ;
  defPTc34     =   'Cor do grid';
  defPTc25     =   'Cheio ' ;
  defPTc18     =   'Classifica��o' ;
  defPTc1      =   'Conhecimentos Espec�ficos' ;
  defPT7774    =   'Continuar' ;
  defPT7778    =   'Copiar';
  defPTc35     =   'Criar Atividade seguinte (ESC)';
  defPT7772    =   'Criando �rea tempor�ria...';
  defPT7773    =   'Criando Indices Novos...';
  defPT104     =   ' da Atividade ';
  defPT1040    =   'Custo';
  defPT1041    =   'Custo Tecnologia';
  defPT1042    =   'Custo M.Obra';
  defPT1043    =   'Custo M.Prima';
  defPT1044    =   'Custo  Rateados';
  defPT1045    =   'Custo  Diretos';
  defPTc5      =   'Custo Anual';
  defPTc13     =   'Custo Aquisi��o/Desenvolvimento' ;
  defPTc14     =   'Custo Anual de Manuten��o'  ;

  //D
  defPT62      =   'Dados';
  defPT621     =   'Data Expira��o :' ;
  defPTd5      =   'Data Implanta��o' ;
  defPT622     =   'Data Registro';
  defPT6220    =   'Data'  ;
  defPT6221    =   'Depend�ncia'  ;
  defPT1250    =   'Descart�vel' ;
  defptd9      =   'Destino'  ;
  defptd10     =   'Direita'  ;
  defPT39      =   'Descri��o ';
  defPTd3      =   'Diret�rios'      ;
  defPTd4      =   'Distribui��o'  ;
  MensaspPT4   =   'Descri��o';
  defPTd6      =   'Desalocar Dimens�o'  ;
  defPTd8      =   'Dimens�o Afetada'   ;
  defPT35      =   'Diagramas ';
  defPTd12     =   'Diagrama ';
  defPT354     =   'Diagrama tamanho Normal'       ;
  defPT355     =   'Diagrama de Processos'         ;
  defPT356     =   'Diagrama de Caso de Uso'           ;
  defPTm1      =   'Diret�rio Default de Programas';
  defPTd2      =   'Diretivas';
  defPT357     =   'Organograma'                   ;
  defPT358     =   'Diagrama Livre'                ;
  defPT2141    =   '  Diagrama sem Objetos ';
  defPT359     =   'Diagrama de Classe'            ;
  defPT353     =   'Diret�rio Diagramas' ;
  defPT351     =   ' dias';
  defPT352     =   'Diagrama & incluido ';
  defPTd11     =   'Dimens�o';
  defPTd1      =   'Dimens�es ';
  defPT25      =   'Deseja Criar ?';
  defPT299     =   'Deseja Recriar ?';
  defPT2991    =   'Diminuir'                      ;
  defPT55      =   'Dom�nio';
  defPT550     =   'Doc. externo' ;

  //E
  defpte27     =   'E'    ;
  defPT288     =   ' e seu .dfm  no Diret�rio ';
  defPT71      =   'Editar';
  defPTe3      =   'Efetivo da Classe';
  MensaspPT2   =   'Efeito';
  defPT26      =   'Elementos de Dado';
  defPTe9      =   'Eliminar Todas Entidades Orf�s        '  ;
  defPTe10     =   'Eliminar Descri��es em branco         '   ;
  defPTe11     =   'Entidades sem correspondentes nos Diagramas'   ;
  defPTe12     =   'Eliminar Entidades selecionadas       ' ;
  defpte20     =   'E-mail : best.suporte@5a.com.br';
  defpte23     =   'Em Aberto' ;
  defpte21     =   'Engenharia reversa - Tabelas' ;
  defPT260     =   'Engenharia Reversa';
  defPT65      =   'Empresa : ';
  defPT650     =   '..em Bancos de Dados ';
  defPT6500    =   '..em Objetos de Neg�cio';
  defPT651     =   'Encerrar' ;
  defPT82      =   'Encolher';
  defPT4       =   'Entidades ';
  defPT52      =   'Entidade Externa';
  defPT111     =   'Entidades Externas';
  defPT1111    =   'Entrar no BEST';
  defPTe1      =   'Envolvimento do Ator';
  defPTe6      =   'Entrevistados' ;
  defPTe7      =   'Envolvidos na A��o Corretiva' ;
  defPTe13     =   'Estilos'  ;
  defPTe14     =   'Estilos da Borda'  ;
  defPTe15     =   'Espessura da Borda'  ;
  defPTe4      =   'Excluir  Correla��o' ;
  defPT92      =   'Esquema';
  defPT922     =   'Escolher um Cen�rio ou criar um novo � partir do Treeview';
  defPT923     =   'Escolher um Diagrama pelo Treeview ou criar um novo';
  defPT9230    =   'Escolher o Reposit�rio'  ;
  defPTe16     =   'Espessura do Tra�o'  ;
  defpte25     =   'Esquerda'  ;
  defpte26     =   'Estica desenho'  ;
  defPTe17     =   'Extremidades'  ;
  defPT18      =   'Eventos' ;
  defPT110     =   'Evento de Neg�cio';
  defPT2       =   'Eventos de Neg�cio';
  defPT222     =   'Eventos IT';
  defPT2220    =   'Eventos que Disparam Atividade' ;
  defPT7220    =   'Exce��es';
  defPT84      =   'Excluir             ';
  defpte22     =   'Executar' ;
  defPT840     =   'Exibir Objetivo do Caso de Uso';
  defPTe5      =   'Existentes';
  defPTe8      =   'Expectativa de ganho'   ;
  defPT81      =   'Expandir';
  MensaspPT3   =   'Expectativa de ganho';
  defPT98      =   'Exportar';
  defPT72      =   'Exportar Diagrama no formato EMF';
  defPT83      =   'Exportar �rvore';
  defPTe2      =   'Experi�ncia';
  defpte18     =   'Exporta��o de Dimens�es' ;
  defpte19     =   'Exporta��o Concluida! ';
  defpte24     =   'Exportar para Disco'    ;

  //F
  defPTf7      =   'Fechado';
  defPTf2      =   'Feminino';
  defPTf1      =   'Formato Dado' ;
  defPT9       =   'Fluxos de Dados';
  defPT900     =   'Fluxos Saindo';
  defPT9000    =   'Fluxos Entrando';
  defPT57      =   'Faixa deve ser entre 1 e 100!';
  defptf5      =   'Folha �nica' ;
  defPT80      =   'Fonte';
  defPTf3      =   'Fonte' ;
  defPTf4      =   'Fonte atual'  ;
  defPT8000    =   'Forma��o Escolar';
  defPT80000   =   'Formal';
  defPT800     =   'Fornecedor';
  defPT49      =   'Mecanismos';
  defPT19      =   'Fun��es';

  //G
  defPTg2      =   'Garfo Cheio'       ;
  defPTg3      =   'Garfo Vazio'    ;
  defPTg4      =   'Garfo Fechado Cheio'  ;
  defPTg5      =   'Garfo Fechado vazio'  ;
  defPT41      =   ' . Grupo de dados';
  defPT191     =   'generalization'    ;
  defPT410     =   'Geral' ;
  defPT78      =   'Gerar SQL';
  defPT788     =   '&Gerar Script SQL';
  defPT789     =   'Gerar Script SQL';
  defptg7      =   'Gerar                          '   ;
  defptg6      =   'Gerar em Planilha' ;
  defPT78902   =   'Gerenciamento' ;
  defPTg1      =   'Gerenciamento'  ;
  defPTg8      =   'Grade';
  defPT78901   =   'Gravar dados para Licenciamento' ;


  //H
  defPTh1      =   'Horas Trabalhadas por Ano';

  //i
  defPT7890    =   'ID Computador' ;
  defpti13     =   'Imagens'  ;
  defPT73      =   'Imprimir/Exportar Requisitos de TI';
  defPT733     =   'Importa��o de Dimens�es';
  defPT7331    =   'Importar para o Cen�rio selecionado ';
  defPT722     =   'Importar`Dimens�es';
  defPT741     =   'Importar Licen�a do Arquivo';
  defPT74      =   'Imprimir Aspectos Cr�ticos';
  defPT75      =   'Imprimir Alvos de Melhoria';
  defPT76      =   'Imprimir Processo';
  defPT761     =   'Imprimir'  ;
  defPTi14     =   'Inconsist�ncias'  ;
  defPTi1      =   'Indicadores'  ;
  defPT271     =   ' inexistente!';
  defPT36      =   'Informa��es : ';
  defPT361     =   'Informa��es sobre a Licen�a' ;
  defPT58      =   'Informar o Percentual!';
  defPT21      =   'Interface';
  defPT211     =   'I&mprimir Objeto';
  defPT212     =   'Imprimir Objeto';
  defPT213     =   'Importando Diagramas...';
  defPT2131    =   'Importando Objetos n�o Gr�ficos...';
  defPT2132    =   'Importando Objetos n�o Gr�ficos...';
  defPT214     =   '  Importando Correla��es.... ';
  defpti4      =   'Importar' ;
  defpti5      =   'Impressora'               ;
  defpti6      =   'Impress�o do Diagrama'  ;
  defpti7      =   'Imprime Cor de Fundo'  ;
  defpti8      =   'Imprime Imagem de fundo'  ;
  defpti9      =   'Imprime tudo'         ;
  defpti10     =   'Imprime Sele��o'         ;
  defpti12     =   'Impress�o'  ;
  defpti11     =   'Inferior'  ;
  defPTi3      =   'Iniciar                                   ';


  //J
  defPT29      =   ' j� criado!';
  defPT500     =   'Jornada padr�o(horas)';
  defPT3       =   'Jun��es';
  defPT333     =   'Jun��o';
  defPTj1      =   'Justificado a esquerda - topo'  ;
  defPTj2      =   'Justificado a esquerda - meio' ;
  defPTj3      =   'Justificado a esquerda - abaixo' ;
  defPTj4      =   'Justificado a direita - topo' ;
  defPTj5      =   'Justificado a direita - meio' ;
  defPTj6      =   'Justificado a esquerda - abaixo' ;

  //L
  defPTl8      =   'Largura';
  defPTl2      =   'Lay Out da tela'  ;
  defPT102     =   'Lista';
  defPTl4      =   'Lista de pessoas' ;
  defPT1020    =   '(A Licen�a vence em : ' ;
  defPT30      =   'Local de Processamento';
  defPTl3      =   'Localiza��o';
  defPT48      =   'Locais de Processamento';
  defPT79      =   'Localizar Atividade em todos os Diagramas';
  defPT799     =   'Localizar Atividade no Diagrama Corrente';
  defPTL9      =   'Login';
  defPTl5      =   'Los�ngulo Cheio' ;
  defPTl6      =   'Los�ngulo vazio'  ;
  defptl7      =   'L�gica' ;

  //M
  defPT105     =   'Manual de Gest�o de Processos';
  defPT1051    =   'Manual';
  defptm6      =   'Margens(mm)'  ;
  defPTm3      =   'Masculino';
  defPT1050    =   'Meio Ambiente';
  defPT112     =   'Mecanismos';
  defPTm7      =   'Mensagem';
  defPT1121    =   'Mesma largura'    ;
  defPT1122    =   'Mesma Altura'     ;
  defPT1123    =   'Mesmo Tamanho (T)';
  defPT221     =   'M�todos';
  defPT11231   =   'M�trica' ;
  defPTM2      =   'M�dia'     ;
  defPT11232   =   'M�nimo' ;
  defPTm8      =   'Miss�o' ;
  defPT22      =   'Modelo de Informa��es';
  defPT220     =   'Mostrar';
  defPTM4      =   'Mostrar Tabelas'  ;
  defptm5      =   'MultiFolha'        ;
  

  //N
  defPTn4      =   'n opcional'  ;
  defPT223     =   'N�vel';
  defPT224     =   'N�vel abaixo' ;
  defptn5      =   'N�veis Abaixo' ;
  defPT225     =   'N�vel acima'  ;
  defPT100     =   'Nome_Banco';
  defPT10005   =   'Nome';
  defPTn2      =   'Nome externo' ;
  defPTn1      =   'Norma'        ;
  defPT100051  =   'Normal';
  defPT69      =   'Novo Cen�rio';
  defPT70      =   'Novo Diagrama';
  defPT85      =   'Nova Empresa';
  defPTn7      =   'Nova Senha ' ;
  defPT850     =   'Novo                ' ;
  defptn6      =   'Novo Fluxo de Dados'       ;
  defPT24      =   ' n�o criado!';
  defPT240     =   ' N�o';


  //O

  defPT1010    =   'Objetivo ';
  defPT101     =   'Objeto ';
  defPT42      =   ' . Objeto de Neg�cio';
  defPT96      =   'Objeto de Neg�cio';
  defPT12      =   'Objetos de Neg�cio';
  defPT86      =   'Objeto de Interface';
  defPT87      =   'Objeto de Controle';
  defPT7       =   'Objetos de Controle';
  defPT6       =   'Objetos de Interface';
  defPT8       =   'Objetos Entidade';
  defPT888     =   'Objeto Entidade';
  defPT8888    =   'Objetivo do Caso de Uso';
  defPT8881    =   'Obrigado por testar o BEST!';
  defPT1260    =   ' Obrigat�rio' ;
  defpto4      =   'Obter Fluxo da Lista'      ;
  defpto3      =   'Orienta��o'   ;
  defPT8882    =   'Origem dos dados';
  defpto5      =   'OU'          ;
  defPTo1      =   'Outros Custos'  ;
  defPTo2      =   'Ordem alfab�tica'    ;

  //P
  defptp15     =  'Paisagem'               ;
  defPT461     =  'Painel';
  defPTp1      =  'Papel do Ator';
  defPT46      =  'Participante';
  defPT460     =  'Per�odo do Evento';
  defPT911     =  'Pend�ncias';
  defPT9111    =  'Pend�ncias do Diagrama';
  defPT9112    =  'Pend�ncias do Cen�rio'   ;
  defptp17     =  'Percentuais de Passagem'  ;
  defPTp10     =  'Permitir ajustar origem' ;
  defPTp11     =  'Permitir ajustar Destino'   ;
  MensaspPT5   =  'Pessoas' ;
  defPT50      =  'Pessoas da Classe : ';
  defPT59      =  'Pessoa';
  defPT13      =  'Pessoas';
  defPT91      =  'Pessoa Nova';
  defPT6721    =  'Pico' ;
  defPTr2      =  'Pontos Relevantes';
  defPTp9      =  'Pontilhado '   ;
  defPTp8      =  'Procedural somente'     ;
  defPTp6      =  'Prot�tipo de Tela'  ;
  defPTp4      =  'Ponto de Vista' ;
  defPTp5      =  'por';
  defPTp16     =  'por';
  defPTp7      =  'Prazo para Conclus�o'   ;
  defPTp2      =  'Premisssas'  ;
  defPTp3      =  'Prioridade'   ;
  defPTp18     =  'Privil�gios'   ;
  defPT9113    =  'Propriedade'   ;
  defPT91130   =  'Propriedades'   ;
  defPTp14     =  'Propriedades das setas'   ;
  defPT671     =  'Processo Externo';
  defPT672     =  'Processo ISO 9000'    ;
  defPT6720    =  'Procurar no Diagrama'    ;
  defPT67200   =  'Procurar os Dados'    ;


  //Q
  defPTq1      =   'Qtde de Turnos' ;
  defPTq2      =   'Quebra por Objeto'  ;

  //R
  defPT67210   =   'Raz�o Social' ;
  defPT1081    =   'Recortar';
  defPT43      =   ' . Regra de Neg�cio';
  defPT90      =   'Regra';
  defPT6722    =   'Regular' ;
  defPTr4      =   'Relacionamentos'  ;
  defPT1070    =   'Reposit�rios Existentes' ;
  defptr5      =   'Registro INPI :  00048106';
  defPT67      =   'Regra de Neg�cio';
  defPT5       =   'Regras de Neg�cio';
  defPT109     =   'RELA��O DAS ATIVIDADES PROCEDURAIS';
  defPT107     =   'RELA��O DOS CASO DE USO';
  defPT37      =   'Requerimentos de TI';
  defPT45      =   'Respons.';
  defPT450     =   'Respons�vel';
  defPTr1      =   'Responsabilidades';
  defPTr3      =   'Resumido'  ;
  defptr6      =   'Retrato'               ;

  //S
  defPT901     =   'Sair';
  defPT903     =   'Salvar' ;
  defPTs4      =   'Salvar Configura��o' ;
  defPTs22     =   'Seguran�a' ;
  defPTs5      =   'Sele��o' ;
  defPT904     =   'Selecionar' ;
  defPTs20     =   'Sem' ;
  defpts9      =   'Sem seta' ;
  defpts23     =   'Senha'  ;
  defpts24     =   'Senha Atual' ;
  defPT99      =   'Servidor';
  defpts6      =   'Seta Origem'  ;
  defpts7      =   'Seta Meio'  ;
  defpts8      =   'Seta Destino'  ;
  defpts10     =   'Seta Cheia Pequena'                   ;
  defpts11     =   'Seta Vazia Pequena';
  defpts12     =   'Seta Cheia M�dia' ;
  defpts13     =   'Seta Vazia M�dia'  ;
  defpts14     =   'Seta Vazia Grande' ;
  defpts15     =   'Seta Cheia Grande'  ;
  defPTs3      =   'Sexo';
  defPTS2      =   'Situa��o'  ;
  defPT93      =   'Sql script para InterBase';
  defPT933     =   'Sql';
  defPT934     =   'S/N'   ;
  defPT935     =   'Sim'           ;
  defpts18     =   'Sobre'       ;
  defPT47      =   'Substituto';
  defpts19     =   'Superior'  ;

  //T
  defPT27      =   'Tabela ';
  defptt12     =   'Tabelas Dispon�veis'  ;
  defptt13     =   'Tabelas a Importar' ;
  defptt14     =   'Tabelas' ;
  defPT270     =   'T�tulo';
  defPTt5      =   'Tecnologia';
  defPT94      =   'Tela Normal';
  defPT960     =   'Tela';
  defPT95      =   'Tela Cheia';
  defPTt3      =   'Telefone';
  defPT1200    =   'Tempos de Processamento (minutos)' ;
  defPT12000   =   'Tempo de Processamento Unit�rio' ;
  defPT12001   =   'Tempo de processamento Inativo' ;
  defPTt2      =   'Tempo Contrata��o';
  defPT952     =   'Temporal';
  defPT950     =   'Texto';
  defPT123     =   'Texto';
  defPT9500    =   'Tipo de Atividade' ;
  defPT121     =   'Tipo de Dado';
  defPT1210    =   'Tipo';
  defPT122     =   'Tipo Licen�a'  ;
  defPT12200   =   'Tipo de Implementa��o'  ;
  defPTt1      =   'Tipo M�todo'  ;
  defPTt4      =   'Tipo de Aspecto' ;
  defPTt15     =   'Tipo de Apresenta��o' ;
  defptt10     =   'Tipo de Seta'   ;
  defPT1221    =   'T�tulo'  ;
  defptt16     =   'Todos'      ;
  defPTt6      =   'Tracejado '   ;
  defptt11     =   'Tra�o'  ;
  defPTt7      =   'Tra�o-Ponto'  ;
  defPTt8      =   'Tra�o-Ponto-Ponto ' ;
  defPTt9      =   'Transparente';
  defPT1230    =   'Transforma��o' ;
  defPT951     =   'Troca WBS por Aplicativo'                 ;
  defPTt17     =   'TreeView'                 ;

  //U
  defPT53      =   'Unidade Organizacional';
  defPTU1      =   'Unidades de tempo'   ;
  defPT64      =   'Caso de Uso';
  defPT6401    =   'Usu�rio :';

  //V
  defPT1270    =   'Valor Aggregado' ;
  defptV3      =   'Verificar Referenciamento dos Processos'  ;
  defPT6400    =   'Vers�o Demonstra��o';
  defPT1220    =   'Vers�o' ;
  defPTv2      =   'Visualizar' ;
  defptv1      =   'Voltar'  ;
  defPT1280    =   'Volumes de Processamento (Anuais)'  ;
  defPT120     =   ' % para Atividade';


  ////////a classificar


    defPTa20  =  'Atividade n�o possui nenhum Fluxo de Entrada!';
    defPTa21  =  'Atividade possui conex�es com outras atividades!';
    defPTa22  =  'Atividade sem Ator!';
    defPTa23  =  'Atividade sem Local de Processamento!';
    defPTa24  =  'Atividade sem Sucessor!';

    defPTe28  =  'Evento de Neg�cio n�o possui Fluxos(s) de Sa�da!';

    defPTf6   =  'Fluxo saindo do Objeto ';//+nodes.item(i).text+
    defPTs21   =  ' sem descri��o!';
    defPTj7   =  'Jun��o deve ter no m�nimo duas saidas!';
    defPTj8   =  'Jun��o s� aceita Atividade como antecessor!';
    defPTo6   =  'Objeto sem Descri��o!';

  /////////////////novos
  DEFPTa28 = 'Acesso total';
  defPTE29 = 'Eliminar privil�gios do diagrama';
  defPTE30 = 'Eliminar todos os privil�gios';
  defPTm9  = 'Mostrar privil�gios';
  DefPTP19 = 'Par�metros default';

  defptt18   = 'Tudo';
  defptr7    = 'Reposit�rios';





  ///////////



  mensPTap1 = 'Locais de Processamento' ;
  mensPTap2 = 'Mecanismos' ;
  mensPTap3 = 'Atores' ;
  mensPTap4 = 'ATIVIDADES';
  mensPTap5 = 'Ocultar Objetivos do Caso de Uso';
  mensPTap6 = 'Exibir Objetivos do Caso de Uso';
  mensPT1   = 'Ajuda n�o dispon�vel!';
  mensPT2   = 'Imposs�vel registrar OCX';
  mensPT3   = 'Mant�m essa configura��o como default ?';
  mensPT4   = 'A imagem dessa entidade n�o existe!' ;
  mensPT5   = 'Ajusta a Entidade a Imagem';
  mensPT6   = 'Correla��o n�o permitida entre objetos n�o definidos!';
  mensPT7   = 'Erro : O Diagrama n�o foi encontrado no diret�rio '+#13+'Verificar as configura��es do banco de dados!';
  mensPT8   = 'Arquivo de Configura��o de Objetos n�o encontrado no Diret�rio de dados';
  mensPT9   = 'Arquivo de Configura��o de Objetos  inexistente!'  ;
  mensPT10  = 'Nenhum n� escolhido';
  mensPT11  = 'Nenhum ou mais de um Objeto escolhido';
  mensPT12  = 'Referencia Circular! A atividade escolhida j� existe na hierarquia acima!'  ;
  mensPT13  = 'Aten��o! Essa Atividade possui decomposi��o! A altera��o provocar� a perda de todos os n�veis abaixo!'+#13+'Continua ?';
  mensPT14  = 'Arquivo contendo �reas de interesse inexistente! Desejar criar agora ?';
  mensPT15  = 'Se excluir essa Empresa,todos seus Cen�rios e Diagramas ser�o tamb�m excluidos!'+#13 +'  Continua ?';
  mensPT16  = 'Se excluir esse Cen�rio,todos seus Diagramas ser�o tamb�m excluidos!'+#13 +'  Continua ?';
  mensPT17  = 'Definir O Objeto antes de decompor!';
  mensPT18  = 'N�o � poss�vel alterar o Tipo de Atividade! A Atividade possui decomposi��o';
  mensPT19  = 'Informar O Nome da Empresa';
  mensPT20  = 'Informar a raz�o Social da Empresa';
  mensPT21  = 'Informar a �rea de Interesse da Empresa';
  mensPT22  = 'Informar a Designa��o';
  mensPT23  = 'Confirma a elimina��o desse Elemento de Dados?';
  mensPT24  = 'Confirma a elimina��o dessa Correla��o?';
  mensPT25  = 'Elimina��o Cancelada!';
  mensPT26  = 'Confirma a elimina��o desse Evento ?';
  mensPT27  = 'Confirma a elimina��o desse lay out ?';
  mensPT28  = 'Alterando a DimensPT�o implica na perda das Correla��es Atuais! Continua ?';
  mensPT29  = 'Confirma a elimina��o  ?';
  mensPT30  = 'N�o foi poss�vel eliminar!';
  mensPT31  = 'Informar a Opera��o';
  mensPT32  = 'Informar o Tipo de Aspecto!';
  mensPT33  = 'Informar o Ponto de Vista!';
  mensPT34  = 'Informar o Tipo de Atividade!';
  mensPT35  = 'A sele��o deve conter o mesmo tipo de conex�o';
  mensPT36  = 'Deseja salvar o Diagrama antes de Sair ?';
  mensPT361 = 'Desejar sair do Diagrama ?';
  mensPT37  = 'Conex�o n�o permitida ';
  mensPT38  = 'Diagrama em uso diferente do Diagrama de Configura��o! ';
  mensPT39  = 'Escolher uma Origem';
  mensPT40  = 'Se excluir essa Atividade,todas as Atividades subordinadas ser�o tamb�m excluidas!'+#13 +'  Continua ?';
  mensPT41  = 'Opera��o sem aspectos cr�ticos!';
  mensPT42  = 'Opera��o sem Alvos de Melhoria!';
  mensPT43  = 'Diagrama exportado com Nome :';
  mensPT44  = 'N�o ha execut�vel cadastrado para essa atividade!';
  mensPT45  = 'N�o foi encontrado Diagrama para essa Atividade! Deseja cri�-lo em branco ?';
  mensPT46  = 'N�o pode alterar Objeto j� definido!';
  mensPT47  = 'Um ou mais componentes de c�lculo do Lead Time est�o faltando! (TPU,TPI OU LOOPING';
  mensPT48  = 'Diagrama em uso por outro usu�rio ou com acesso restrito! Ser� aberto somente para leitura!';
  mensPT49  = 'Desenhos n�o Permitidos na vers�o Viewer!';
  mensPT50  = '� recomend�vel efetuar o back up antes da Compacta��o! '+#13+'Continua ?';
  mensPT51  = 'Informar o Nome do Servidor SQL!';
  mensPT52  = 'Informar o caminho do Banco de dados Access!';
  mensPT53  = 'Campo BLOB n�o pode ser Chave!';
  mensPT54  = 'N�o � permitido eliminar!';
  mensPT55  = 'Vers�o demo : n�mero m�ximo de objetos gr�ficos ultrapassado!';
  mensPT56  = 'Essa Conex�o s� � permitida entre Regra de Neg�cio e Atividade!';
  mensPT57  = 'J� existe uma conex�o!';
  mensPT58  = 'Informar a Dimens�o! ( A Dimens�o deve estar cadatrada nos Dom�nios)';
  mensPT59  = 'Informar a Categoria do Ator!';
  mensPT60  = 'N�o � permitido conectar dois Objetos Diferentes a mesma Atividade Origem! Usar Jun��o para isso!';
  mensPT61  = 'Jun��o Tipo <OU> n�o pode ter mais que dois Fluxos saindo!' ;
  mensPT62  = 'Aten��o : Verificar os Percentuais de Passagem ap�s altera��o da L�gica da Jun��o!';
  mensPT63  = 'Objeto Antecessor a Jun��o deve ser Jun��o ou Atividade!';
  mensPT64  = 'N�o ha nenhuma Ator Associado a esta Atividade!';
  mensPT65  = 'N�o � poss�vel copiar para outro Empresa/Cen�rio';
  mensPT66  = 'N�o � poss�vel copiar para outra classe de Diagrama!';
  mensPT67  = 'Colar Completo(SIM) ou somente esqueleto(N�O) ?';
  mensPT68  = 'Diagrama sem Atividade!';
  mensPT69  = 'N�o ha Local de Processamento definido';
  mensPT70  = 'Informar se Atividade procedural ou n�o';
  mensPT71  = 'Jun��o  n�o pode ter mais que 1 Fluxo entrando!' ;
  mensPT72  = 'Imposs�vel calcular Custos : Existem Diagramas Inconsistentes!' ;
  mensPT73  = 'Informar o Tipo de Exporta��o!' ;
  mensPT74  = 'Informar o Nome do Arquivo para Exporta��o!' ;
  mensPT75  = 'Problemas na Exporta��o dos Relat�rios ! Tentar novamente' ;
  mensPT76  = 'Nada a Imprimir!';
  mensPT77  = 'Nada a Exportar!';
  mensPT78  = 'Necess�rio preencher Usu�rio, Empresa e Id do Computador!'  ;
  mensPT79  = 'Atividade n�o encontrada!'  ;
  mensPT80  = 'Informar o Alias!'  ;
  mensPT81  = 'Alias j� usado! Continua assim mesmo ?'  ;
  mensPT82  = 'Necess�rio Definir Chave prim�ria!'  ;
  mensPT83  = 'N�o foi poss�vel incluir tabela de Tipos do Provider';
  mensPT84  = 'Informar a Empresa';
  mensPT85  = 'Informar o Cen�rio';
  mensPT86  = 'N�o foi poss�vel Atualizar!';
  mensPT87  = 'Informar o Nome do Diagrama';
  mensPT88  = 'Informar a Classe do Diagrama';
  mensPT89  = 'Informar um nome para o diagrama';
  mensPT90  = 'Definir um Status!';
  mensPT91  = 'Escolher um Cen�rio!';
  mensPT92  = 'N�o foi poss�vel eliminar o atributo!';
  mensPT93  = 'Apagando Correla��es Soltas de ';
  mensPT94  = 'Imposs�vel encontrar diagrama no diret�rio ';
  mensPT95  = 'N�o foi poss�vel abrir o Banco de dados!'+#13+'Verificar as Configura��es!'+#13+'Acesse o sistema e clique no item de menu "Reposit�rios".';
  mensPT96  = 'Por precau��o, verificar se o Backup foi efetuado corretamente em ';
  mensPT97  = 'Requerimentos exportados para Planilha ';
  mensPT98  = 'Tipo de Dados deve ser C : Car�ter; I : Inteiro; N : real; M : Memo; D : Data; T : hora' ;
  mensPT99  = 'Associa��o Falhou! Tentar novamente!';
  mensPT100 = 'Cancelado';
  mensPT101 = 'Nenhum �tem selecionado!';
  mensPT1010= 'O Mecanismo ';
  mensPT102 = ' n�o existe!';
  mensPT103 = 'N�o ha Mecanismo associado a essa Atividade)!';
  mensPT104 = 'N�o ha Mecanismo associado a essa Atividade)!';
  mensPT105 = 'Selecionar um Diagrama';
  mensPT106 = 'Nenhuma Tabela escolhida';
  mensPT107 = 'Diagrama escolhido n�o permite gera��o de Triggers';
  mensPT108 = 'N�o � permitido alterar Chave da Tabela ';
  mensPT109 = '% n�o encontrado';
  mensPT110 = 'N�o foi poss�vel completar a atualiza��o! Verifique os dados!';
  mensPT111 = 'N�o ha nenhum Banco de dados configurado! Desejar configurar agora ?';
  mensPT112 = 'Informar o Nome do Servidor SQL!';
  mensPT113 = 'Informar o Nome do Banco';
  mensPT114 = 'Tabela PROVIDER_DATA n�o cont�m valor padr�o para ';
  mensPT115 = 'O Arquivo LIMPO.ADD n�o foi encontrado no Diret�rio ';
  mensPT116 = 'Conex�o n�o criada!';
  mensPT117 = 'N�o H� Diret�rio definido para esse programa! Informar o Diret�rio(no Cen�rio como padr�o ou no nome do execut�vel)  ';
  mensPT118 = 'Essa vers�o Demo n�o pode abrir Reposit�rios criados com outras Versoes';
  mensPT119 = 'Aguardar....';
  mensPT120 = 'Confirma a Exclus�o desse Alias ?';
  mensPT121 = 'Tipo de Dados Incorreto';
  mensPT122 = 'Informar os dados para Exporta��o';
  mensPT123 = 'N�o pode Importar para o mesmo Cen�rio!';
  mensPT124 = 'N�o h� nenhum Reposit�rio escolhido!';
  mensPT125 = 'Esse Ator n�o executa essa Atividade!';
  mensPT126 = 'N�o foi poss�vel criar o Diret�rio ';
  mensPT127 = 'A Atividade n�o possui decomposi��o! Deseja cri�-la ?';
  mensPT128 = 'Objeto Gr�fico Desconhecido ';
  mensPT129 = 'Defini��o do Fluxo de Dados n�o encontrada ';
  mensPT130 = 'Importa��o - C�digo Novo n�o atualizado! ';
  mensPT131 = 'Imposs�vel deletar arquivo - Verificar se n�o esta em uso : ' ;
  mensPT132 = 'N�o foi poss�vel criar o Diret�rio Tempor�rio! Opera��o interrompida! ' ;
  mensPT133 = 'Copiando Diret�rio & para Diret�rio @ ' ;
  mensPT134 = 'Imposs�vel Copiar arquivo - Verificar se n�o esta em uso : ' ;
  mensPT135 = 'Importa��o terminada... ' ;
  mensPT136 = 'Diagrama da Atividade & n�o encontrado!... ' ;
  mensPT137 = 'Procurando a Atividade ' ;
  mensPT138 = 'N�o h� Diagrama � Importar ' ;
  mensPT139 = 'A Tabela & n�o p�de ser incluida! J� existia ? ' ;
  mensPT140 = 'A Classe & j� existe! Continua (e perde a Classe j� existente) ' ;
  mensPT141 = 'Deseja Incluir os Atributos da Tabela & como propriedades da Classe # ?';
  mensPT142 = 'A Classe & j� possui atributos! Reinicializa ?';
  mensPT143 = 'Confirma a Exclus�o das Propriedades ?';
  mensPT144 = '& n�o encontrado no diret�rio #';
  mensPT145 = 'O arquivo & j� existe! Reinicializa ( e perder o Atual) ?';
  mensPT146 = 'Especificar pelo menos 1 Atributo como Chave Prim�ria!';
  mensPT147 = 'Query Cancelada pelo Usu�rio';
  mensPT148 = 'Aguardar .O BEST esta compilando os Requerimentos de TI.';
  mensPT149 = 'Planilha gerada com Nome REQUERIM_TI.XLS no Diret�rio ';
  mensPT150 = 'Deseja Fazer LogOff (yes) ou Sair mesmo(No) ? ';
  mensPT151 = 'Privil�gio j� existente!';
    
  mensPT152 = 'Informar o Usu�rio!';
  mensPT153 = 'Escolher pelo menos um Caso de Uso' ;
  mensPT154 = 'Informar o Acesso Default!'  ;
  mensPT155 = 'Informar o Nivel Default!' ;
  mensPT156 = 'Deseja mesmo eliminar o Privil�gio do usu�rio '  ;
  mensPT157 = ' para o Diagrama ' ;
  mensPT158 = 'Deseja mesmo eliminar todos os Privil�gios do usu�rio ' ;
  mensPT159 = 'Informar a Pessoa!';
  mensPT160 = 'Imposs�vel alocar a Pessao a Usu�rio'  ;
  mensPT161 = 'Nome j� usado';
  mensPT162 = 'Informar a Senha';
  mensPT163 = 'BEST - Controle de Acesso' ;
  mensPT164 = 'Informar o Nome!';
  mensPT165 = ' n�o tem Privil�gios para acessar essa fun��o' ;
  mensPT166 = 'Nome e/ou senha incorreto(s) ' ;
  mensPT167 = 'Senha Atual n�o Informada!';
  mensPT168 = 'Senha Nova n�o Informada!';
  mensPT169 = 'Senha Confirmada n�o Informada!';
  mensPT170 = 'Senha informada diferente de senha confirmada!';
  mensPT171 = 'Nome/Senha Inv�lidos';
  mensPT172 =  'Senha n�o foi atualizada! Tente Novamente!';
  mensPT173 =  'Senha Atualizada com Sucesso!'  ;

  //icereg
  mensPTreg1   = 'Dados para Licenciamento foram salvos no arquivo :';
  MensPTreg1_1 = 'Enviar esse Arquivo para MYTECH : best.suporte@5a.com.br para obter Licen�a' ;
  MensPTreg2   = 'A Licen�a expirou! Favor Registrar!';
  MensPTReg3   = 'A Data do Sistema foi recuada! Voltar a Data Correta! !';
  MensPTreg4   = 'O Programa execut�vel foi modificado! Voltar o Original! !';
  MensPTReg5   = 'Esse Computador n�o esta autorizado a usar este programa!Solicite uma Licen�a !';
  MensPTReg6   = 'Licen�a Inv�lida!' +#13+ 'Verificar usu�rio, Empresa e Chave e Tentar Outra Vez!';
  MensPTReg7   = 'Licen�a Full Expirada, favor renovar !';
  MensPTReg8   = 'Licen�a Provis�ria para ';
  MensPTreg8_8 = 'Empresa :';
  MensPTReg9   = 'Nenhuma Licen�a foi detectada para esse Programa : (ID Computador : ';
  MensPTReg10  = 'Registro Excluido!';
  MensPTReg11  = 'Licen�a Provis�ria!';
  MensPTReg12  = 'Sem Licen�a'  ;
  MensPTReg13  = 'Essa Dimens�o j� foi exportada'  ;


  EIPT1   = 'Erro_interno : Objeto escolhido n�o foi encontrado!';
  EIPT2   = 'Erro_interno : Decomposi��o : o n� da �rvore n�o tem filho!';
  EIPT3   = 'Erro_interno : Imposs�vel efetuar a decomposi��o!';
  EIPT4   = 'Erro_interno : Imposs�vel criar Objeto !';
  EIPT5   = 'Erro_interno : Imposs�vel ler Diagrama  !';
  EIPT6   = 'Erro_interno : Imposs�vel Salvar Diagrama  no BD !';
  EIPT7   = 'Erro_interno : Imposs�vel Ler Diagrama  no BD !';
  EIPT8   = 'Erro_interno : Erro na estrutura do desenho da Jun��o! !';
  EPT19   = 'Erro Interno : Atividade escolhida n�o foi encontrada na �rvore!';
  EPT20   = 'Erro Interno : Imposs�vel redimensionar Ator ';
  EPT21   = 'Erro Interno : Tabela inexistente nas constantes wobj ';

  
implementation

uses bst_main, bst_aspectos;


function fMainMenuPT (Menu : TMainMenu) : TMainMenu;
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
     MENU.Items[i].Caption := cMainPT[i];
     case i of
       0 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cMainPT0[j];
               end;

            end;
       1 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cMainPT1[j];
                 case j of
                   5 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainPT15[k];
                           end;
                        end;
                   7 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainPT17[k];
                           end;
                        end;
                   8 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainPT18[k];
                           end;
                        end;
                   9 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainPT19[k];
                           end;
                        end;
                   end;
               end;
            end;

          3 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainPT35[k];
                           end;
                     menu.Items[i].Items[j].Caption := cMainPT3[j];

                   end;
               end;

           4 :  Begin     //seguran�a
                 for j := 0 to menu.Items[i].Count-1 do
                     menu.Items[i].Items[j].Caption := cMainPT51[j];
                 end;

           5 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     menu.Items[i].Items[j].Caption := cMainPT4[j];

                   end;
                 end;
            6 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     menu.Items[i].Items[j].Caption := cMainPT5[j];

                   end;
                 end;

      end;
     end;
  result := menu;
 end;
//Menus TreeAtiv
function fTreeAtivPopnodePT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup PopNode
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
     MENU.Items[i].Caption := cTreeAtivPopNodePT[i];
     case i of
       4 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cTreeAtivPopNodePT4[j];
               end;

            end;
      end;
     end;
  result := menu;
 end;

function fTreeAtivEntPopePT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup EntPop - TreeAtiv
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
       MENU.Items[i].Caption := cTreeAtivEntPopPT[i];
      end;

  result := menu;
 end;

function fTreeAtivPopLinkPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup PopLink - TreeAtiv
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
       MENU.Items[i].Caption := cTreeAtivPopLinkPT[i];
      end;

  result := menu;
 end;

function fTreeAtivPopLivPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup FreeDiagram - TreeAtiv
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
       MENU.Items[i].Caption := cTreeAtivPopLivPT[i];
       case i of
       2 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cTreeAtivPopNodePT4[j];
               end;

            end;
      end;
      end;

  result := menu;
 end;

function fQueryPT (Menu : TMainMenu) : TMainMenu;  //menu Qury
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
       MENU.Items[i].Caption := cQueryPT[i];
       case i of
       0 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cQueryPT1[j];
               end;

            end;
      end;
      end;

  result := menu;
 end;


//TelaObj
function fObjPopUpPT (Menu : TPopupMenu) : TPopUpMenu;  //menu Popup do TelaObj
var
i,j,k : integer;
 Begin

   for i := 0 to menu.Items.Count -1 do
     Begin
       MENU.Items[i].Caption := cObjPopUpPT[i];
      end;
  result := menu;
 end;

 function fResPT : boolean;    //carregar todos os strings (constantes)
  Begin

       dim1     :=   dimPT1 ;
       dim2     :=   dimPT2 ;
       dim3     :=   dimPT3 ;
       dim4     :=   dimPT4 ;
       dim5     :=   dimPT5 ;
       dim6     :=   dimPT6 ;

       //ICEREG
       mensreg1      :=   mensPTreg1    ;
       Mensreg1_1    :=   MensPTreg1_1  ;
       Mensreg2      :=   MensPTreg2    ;
       MensReg3      :=   MensPTReg3    ;
       Mensreg4      :=   MensPTreg4    ;
       MensReg5      :=   MensPTReg5    ;
       MensReg6      :=   MensPTReg6    ;
       MensReg7      :=   MensPTReg7    ;
       MensReg8      :=   MensPTReg8    ;
       Mensreg8_8    :=   MensPTreg8_8  ;
       MensReg9      :=   MensPTReg9    ;
       MensReg10     :=   MensPTReg10   ;
       MensReg11     :=   MensPTReg11   ;
       MensReg12     :=   MensPTReg12   ;
       MensReg13     :=   MensPTReg13   ;


       

        def97     :=   defPT97   ;
        def970    :=   defPT970  ;
        def38     :=   defPT38   ;
        def381    :=   defPT381  ;
        def382    :=   defPT382  ;
        def383    :=   defPT383  ;
        def384    :=   defPT384  ;
        def3841   :=   defPT3841 ;
        def385    :=   defPT385  ;
        def380    :=   defPT380  ;
        def3800   :=   defPT3800 ;
        def38001  :=   defPT38001;
        def3802   :=   defPT3802 ;
        def3803   :=   defPT3803 ;
        def3804   :=   defPT3803 ;
        def3805   :=   defPT3803 ;
        def3806   :=   defPT3803 ;
        def3807   :=   defPT3803 ;
        def3808   :=   defPT3803 ;



        def3801    :=   defPT3801   ;
        def32      :=   defPT32     ;
        def321     :=   defPT321    ;
        def3211    :=   defPT3211   ;
        def103     :=   defPT103    ;
        def40      :=   defPT40     ;
        def63      :=   defPT63     ;
        def56      :=   defPT56     ;
        def61      :=   defPT61     ;
        def34      :=   defPT34     ;
        def340     :=   defPT340    ;
        def10      :=   defPT10     ;
        def1000    :=   defPT1000   ;
        def10000   :=   defPT10000  ;
        def10001   :=   defPT10001  ;
        def10002   :=   defPT10002  ;
        def10003   :=   defPT10003  ;
        def100030  :=   defPT100030 ;
        def10006   :=   defPT10006  ;
        dEf10004   :=   defPT10004  ;
        def10005   :=   defPT10005  ;
        def100051  :=   defPT100051 ;

        def88     :=   defPT88   ;
        def882    :=   defPT882  ;
        def8821   :=   defPT8821 ;
        def883    :=   defPT883  ;
        def881    :=   defPT881  ;
        def20     :=   defPT20   ;
        def23     :=   defPT23   ;
        def233    :=   defPT233  ;
        def51     :=   defPT51   ;
        def510    :=   defPT510  ;
        def28     :=   defPT28   ;
        def280    :=   defPT280  ;
        def77     :=   defPT77   ;
        def777    :=   defPT777  ;
        def7771   :=   defPT7771 ;
        def7772   :=   defPT7772 ;
        def7773   :=   defPT7773 ;
        def7774   :=   defPT7774 ;
        def7775   :=   defPT7775 ;
        def7776   :=   defPT7776 ;
        def7777   :=   defPT7777 ;


        def1opt := defPT1opt;
        def12n  :=   defPT12n ;

        defa1    := defPTa1 ;
        defa2    := defPTa2 ;
        defa3    := defPTa3 ;
        defa4    := defPTa4 ;
        defa6    := defPTa6 ;
        defa7    := defPTa7 ;
        defA8    := defPTA8 ;
        defA9    := defPTA9 ;
        defa10   := defPTa10;
        defa11   := defPTa11;
        defa12   := defPTa12;
        defa13   := defpta13;
        defa14   := defpta14;
        defa15   := defPTa15 ;
        defa16   := defPTa16 ;
        defa17   := defPTa17 ;
        defa18   := defPTa18 ;
        defa19   := defPTa19 ;
        defa20   := defPTa20 ;
        defa21   := defPTa21 ;
        defa22   := defPTa22 ;
        defa23   := defPTa23 ;
        defa24   := defPTa24 ;
        defa25   := defPTa25 ;
        defa26   := defPTa26 ;
        defa27   := defPTa27 ;
        defa28   := defPTa28 ;

        defc1    :=   defPTc1 ;
        defc2    :=   defPTc2 ;
        defc3    :=   defPTc3 ;
        defc4    :=   defPTc4 ;
        defc5    :=   defPTc5 ;
        defc6    :=   defPTc6 ;
        defc7    :=   defPTc7 ;
        defc8    :=   defPTc8 ;
        defc9    :=   defPTc9 ;
        defc11   :=   defPTc11;
        defc12   :=   defPTc12;
        defc13   :=   defPTc13;
        defc14   :=   defPTc14;
        defc15   :=   defPTc15;
        defc16   :=   defPTc16;
        defc17   :=  defPTc17 ;
        defc18   :=  defPTc18 ;
        defc19   :=  defPTc19 ;
        defc20   :=  defPTc20 ;
        defc21   :=  defPTc21 ;
        defc22   :=  defPTc22 ;
        defc23   :=  defPTc23 ;
        defc24   :=  defPTc24 ;
        defc25   :=  defPTc25 ;
        defc26   :=  defPTc26 ;
        defc27   :=  defPTc27 ;
        defc28   :=  defPTc28 ;
        defc29   :=  defptc29 ;
        defc30   :=  defptc30 ;
        defc31   :=  defptc31 ;
        defc32   :=  defptc32 ;
        defC33   :=  defptC33 ;
        defc34   := defPTc34 ;
        defc35   := defPTc35 ;
        defc36   := defPTc36 ;
        defc37   := defPTc37 ;

        defd1    :=  defPTd1 ;
        defd2    :=  defPTd2 ;
        defd3    :=  defPTd3 ;
        defd4    :=  defPTd4 ;
        defd5    :=  defPTd5 ;
        defd6    :=  defPTd6 ;
        defd7    :=  defPTd7 ;
        defd8    :=  defPTd8 ;
        defd9    :=  defptd9 ;
        defd10   :=  defptd10;
        defd11   :=  defptd11;
        defd12   :=  defptd12;

        defe1    :=  defPTe1 ;
        defe2    :=  defPTe2 ;
        defe3    :=  defPTe3 ;
        defe3    :=  defPTe3 ;
        defe4    :=  defPTe4 ;
        defe5    :=  defpte5 ;
        defe6    :=  defPTe6 ;
        defe7    :=  defPTe7 ;
        defe8    :=  defPTe8 ;
        defe9    :=  defPTe9 ;
        defe10   :=  defPTe10;
        defe11   :=  defPTe11;
        defe12   :=  defPTe12;
        defe13   :=  defPTe13;
        defe14   :=  defPTe14;
        defe15   :=  defPTe15;
        defe16   :=  defPTe16;
        defe17   :=  defPTe17;
        defe18   :=  defpte18;
        defe20   :=  defpte20;
        defe21   :=  defpte21;
        defe22   :=  defpte22;
        defe23   :=  defpte23;
        defe24   :=  defpte24;
        defe25   :=  defpte25;
        defe26   :=  defpte26;
        defe27   :=  defpte27;
        defe28   :=  defpte28;
        defe29   :=  defPTE29 ;
        defe30   :=  defPTE30 ;




        defF1    :=  defPTF1 ;
        deff2    :=  defPTf2 ;
        defF3    :=  defPTF3 ;
        deff4    :=  defPTf4 ;
        def19    :=  defpt19 ;
        deff5    :=  defptf5 ;
        deff6    :=  defptf6 ;
        deff7    := defPTf7 ;

        defl8    := defPTl8 ;
        defl9    := defPTl9 ;
        

        defg1    :=  defPTg1 ;
        defg2    :=  defPTg2 ;
        defg3    :=  defPTg3 ;
        defg4    :=  defPTg4 ;
        defg5    :=  defPTg5 ;
        defg6    :=  defptg6 ;
        defg7    :=  defptg7 ;
        defg8    := defPTg8 ;

        defh1    :=  defPTh1  ;


        defi1    :=  defPTi1  ;
        defi5    :=  defpti5  ;

        defi3    :=  defPTi3  ;
        defi4    :=  defPTi4  ;
        defi6    :=  defpti6  ;
        defi7    :=  defpti7  ;
        defi8    :=  defpti8  ;
        defi9    :=  defpti9  ;
        defi10   :=  defpti10 ;
        defi11   :=  defpti11 ;
        defi12   :=  defpti12 ;
        defi13   :=  defpti13 ;
        defi14   :=  defpti14 ;

        defj1    :=  defPTj1 ;
        defj2    :=  defPTj2 ;
        defj3    :=  defPTj3 ;
        defj4    :=  defPTj4 ;
        defj5    :=  defPTj5 ;
        defj6    :=  defPTj6 ;
        defj7    :=  defPTj7 ;
        defj8    :=  defPTj8 ;

        defl3    :=  defPTl3 ;
        defl4    :=  defPTl4 ;
         defl5   :=  defPTl5 ;
         defl6   :=  defPTl6 ;
         defl7   :=  defptl7 ;



        defm1    :=   defPTm1 ;
        defm2    :=   defPTm2 ;
        defm3    :=   defPTm3 ;
        defm4    :=   defPTm4 ;
        defm5    :=   defptm5 ;
        defm6    :=   defptm6 ;
        defm7    :=   defptm7 ;
        defm8    :=   defptm8 ;
        defm9    :=   defPTm9;



        defN1    :=   defPTN1  ;
        defn2    :=   defPTn2  ;
        defn4    :=   defPTn4  ;
        defn5    :=   defptn5  ;
        defn6    :=   defptn6  ;
        defn7    :=   defptn7  ;


        defo1    :=   defPTo1  ;
        defo2    :=   defPTo2  ;
        defo3    :=   defpto3  ;
        defo4    :=   defpto4  ;
        defo5    :=   defpto5  ;
        defo6    :=   defpto6  ;



        defp1    :=   defPTp1 ;
        defp2    :=   defPTp2 ;
        defp3    :=   defPTp3 ;
        defp4    :=   defPTp4 ;
        defp5    :=   defPTp5 ;
        defp6    :=   defPTp6 ;
        defp7    :=   defPTp7 ;
        defp8    :=   defPTp8 ;
        defp9    :=   defPTp9 ;
        defp10   :=   defPTp10;
        defp11   :=   defPTp11;
        defp14   :=   defPTp14;
        defp15   :=   defPTp15;
        defp16   :=   defPTp16;
        defp17   :=   defptp17;
        defp18   :=   defptp18;
        defp19   :=   DefPTP19 ;

        defq1    :=   defPTq1  ;
        defq2    :=   defPTq2  ;

        defr1    :=   defPTr1;
        defr2    :=   defPTr2;
        defr3    :=   defPTr3;
        defr4    :=   defPTr4;
        defr5    :=   defPTr5;
        defr6    :=   defptr6;
        defr7    :=   defptr7;

        defS2    :=   defPTS2 ;
        defS3    :=   defPTS3 ;
        defs4    :=   defPTs4 ;
        defs5    :=   defPTs5 ;
        defs6    :=   defpts6 ;
        defs7    :=   defpts7 ;
        defs8    :=   defpts8 ;
        defs9    :=   defpts9 ;
        defs10   :=   defpts10;
        defs11   :=   defpts11;
        defs12   :=   defpts12;
        defs13   :=   defpts13;
        defs14   :=   defpts14;
        defs15   :=   defpts15;
        defs18   :=   defpts18;
        defs19   :=   defpts19;
        defs20   :=   defpts20;
        defs21   :=   defpts21;
        defs22   :=   defpts22;
        defs23   :=   defpts23;
        defs24   :=   defpts24;

        defT1    :=   defPTT1 ;
        defT2    :=   defPTT2 ;
        defT3    :=   defPTT3 ;
        deft4    :=   defPTt4 ;
        deft5    :=   defPTt5 ;
        defT6    :=   defPTT6 ;
        defT7    :=   defPTT7 ;
        deft8    :=   defPTt8 ;
        deft9    :=   defPTt9 ;
        deft10   :=   defptt10;
        deft11   :=   defptt11;
        deft12   :=   defptt12;
        deft13   :=   defptt13;
        deft14   :=   defptt14;
        deft15   :=   defptt15;
        deft16   :=   defptt16;
        deft17   :=   defptt17;
        deft18   :=   defptt18;

        defU1    :=   defPTU1 ;

        defv1    :=   defptv1 ;
        defv2    :=   defptv2 ;
        defV3    :=   defptV3 ;

        def7778  :=   defPT7778  ;
        def7779  :=   defPT7779  ;
        def77779 :=   defPT77779 ;
        def777779:=   defPT777779;
        def104   :=   defPT104   ;
        def1040  :=   defPT1040  ;
        def1041  :=   defPT1041  ;
        def1042  :=   defPT1042  ;
        def1043  :=   defPT1043  ;
        def1044  :=   defPT1044  ;
        def1045  :=   defPT1045  ;
        def62    :=   defPT62    ;
        def621   :=   defPT621   ;
        def622   :=   defPT622   ;
        def6221  :=   defPT6221  ;
        def6220  :=   defPT6220  ;

        def39    :=   defPT39    ;
        def35    :=   defPT35    ;
        def351   :=   defPT351   ;
        def352   :=   defPT352   ;
        def353   :=   defPT353   ;
        def354   :=   defPT354   ;
        def355   :=   defPT355   ;
        def356   :=   defPT356   ;
        def357   :=   defPT357   ;
        def358   :=   defPT358   ;
        def359   :=   defPT359   ;

        def25    :=   defPT25    ;
        def299   :=   defPT299   ;
        def2991  :=   defPT2991  ;
        def55    :=   defPT55    ;
        def550   :=   defPT550   ;
        def71    :=   defPT71    ;
        def26    :=   defPT26    ;
        def260   :=   defPT260   ;
        def65    :=   defPT65    ;
        def650   :=   defPT650   ;
        def6500  :=   defPT6500  ;

        def651   :=   defPT651   ;
        def4     :=   defPT4     ;
        def52    :=   defPT52    ;
        def111   :=   defPT111   ;
        def1111  :=   defPT1111  ;
        def92    :=   defPT92    ;
        def922   :=   defPT922   ;
        def923   :=   defPT923   ;
        def9230  :=   defPT9230  ;
        def18    :=   defPT18    ;
        def110   :=   defPT110   ;
        def2     :=   defPT2     ;
        def222   :=   defPT222   ;
        def2220  :=   defPT2220  ;
        def72    :=   defPT72    ;
        def722   :=   defPT722   ;
        def81    :=   defPT81    ;
        def82    :=   defPT82    ;
        def83    :=   defPT83    ;
        def84    :=   defPT84    ;
        def840   :=   defPT840   ;
        def98    :=   defPT98    ;
        def288   :=   defPT288   ;
        def9     :=   defPT9     ;
        def900   :=   defPT900   ;
        def9000  :=   defPT9000  ;
        def57    :=   defPT57    ;
        def80    :=   defPT80    ;
        def800   :=   defPT800   ;
        def8000  :=   defPT8000  ;
        def80000 :=   defPT80000 ;

       def49     :=   defPT49    ;
       def19     :=   defPT19    ;
       def191    :=   defPT191   ;
       def41     :=   defPT41    ;
       def410    :=   defPT410   ;
       def78     :=   defPT78    ;
       def788    :=   defPT788   ;
       def789    :=   defPT789   ;
       def7890   :=   defPT7890  ;
       def78902  :=   defPT78902 ;
       def78901  :=   defPT78901 ;
       def73     :=   defPT73    ;
       def733    :=   defPT733   ;
       def7331   :=   defPT7331  ;
       def74     :=   defPT74    ;
       def741    :=   defPT741   ;
       def75     :=   defPT75    ;
       def76     :=   defPT76    ;
       def761    :=   defPT761   ;
       def7610   :=   defPT7610  ;
       def7611   :=   defPT7611  ;

       def271    :=   defPT271   ;
       def36     :=   defPT36    ;
       def361    :=   defPT36    ;
       def58     :=   defPT58    ;
       def21     :=   defPT21    ;
       def211    :=   defPT211   ;
       def212    :=   defPT212   ;
       def213    :=   defPT213   ;
       def2131   :=   defPT2131  ;
       def2132   :=   defPT2132  ;
       def214    :=   defPT214   ;
       def2141   :=   defPT2141  ;
       def29     :=   defPT29    ;
       def3      :=   defPT3     ;
       def333    :=   defPT333   ;
       def102    :=   defPT102   ;
       def1020   :=   defPT1020  ;
       def30     :=   defPT30    ;
       def48     :=   defPT48    ;
       def79     :=   defPT79    ;
       def799    :=   defPT799   ;
       def105    :=   defPT105   ;
       def1051   :=   defPT1051  ;

       def1050   :=   defPT1050  ;
       def112    :=   defPT112   ;
       def1121   :=   defPT1121  ;
       def1122   :=   defPT1122  ;
       def1123   :=   defPT1123  ;
       def11231  :=   defPT11231 ;
       def11232  :=   defPT11232 ;
       def22     :=   defPT22    ;
       def220    :=   defPT220   ;

       def221    :=   defPT221   ;
       def223    :=   defPT223   ;
       def224    :=   defPT224   ;
       def225    :=   defPT225   ;

       def100    :=   defPT100   ;
       def69     :=   defPT69    ;
       def70     :=   defPT70    ;
       def85     :=   defPT85    ;
       def850    :=   defPT850   ;
       def24     :=   defPT24    ;
       def240    :=   defPT240   ;
       def101    :=   defPT101   ;
       def1010   :=   defPT1010  ;

       def42     :=   defPT42    ;
       def96     :=   defPT96    ;
       def12     :=   defPT12    ;
       def86     :=   defPT86    ;
       def87     :=   defPT87    ;
       def7      :=   defPT7     ;
       def6      :=   defPT6     ;
       def8      :=   defPT8     ;
       def8888   :=   defPT8888  ;
       def888    :=   defPT888   ;
       def8881   :=   defPT8881  ;
       def8882   :=   defPT8882  ;
       def7220   :=   defPT7220  ;

       def46     :=   defPT46    ;
       def460    :=   defPT460;
       def461    :=   defPT461   ;
       def50     :=   defPT50    ;
       def500    :=   defPT500   ;

       def59     :=   defPT59    ;
       def13     :=   defPT13    ;
       def91     :=   defPT91    ;
       def911    :=   defPT911   ;
       def9111   :=   defPT9111  ;
       def9112   :=   defPT9112  ;
       def9113   :=   defPT9113  ;
       def91130  :=   defPT91130 ;

       def67     :=   defPT67    ;
       def671    :=   defPT671   ;
       def672    :=   defPT672   ;
       def6720   :=   defPT6720  ;
       def67200  :=   defPT67200 ;
       def6721   :=   defPT6721  ;
       def67210  :=   defPT67210 ;
       def6722   :=   defPT6722  ;

       def5      :=   defPT5     ;
       def106    :=   defPT106   ;
       def107    :=   defPT107   ;
       def1070   :=   defPT1070  ;
       def108    :=   defPT108   ;
       def1081   :=   defPT1081  ;
       def109    :=   defPT109   ;
       def37     :=   defPT37    ;
       def45     :=   defPT45    ;
       def450    :=   defPT450   ;

       def43     :=   defPT43    ;
       def90     :=   defPT90    ;
       def902    :=   defPT902   ;
       def901    :=   defPT901   ;
       def903    :=   defPT903   ;
       def904    :=   defPT904   ;
       def99     :=   defPT99    ;
       def93     :=   defPT93    ;
       def933    :=   defPT933   ;
       def934    :=   defPT934   ;
       def935    :=   defPT935   ;

       def47     :=   defPT47    ;
       def27     :=   defPT27    ;
       def270    :=   defPT270   ;
       def94     :=   defPT94    ;
       def960    :=   defPT960   ;

       def95     :=   defPT95    ;
       def950    :=   defPT950   ;
       def9500   :=   defPT9500  ;
       def951    :=   defPT951   ;
       def952    :=   defPT952   ;

       def53     :=   defPT53    ;
       def64     :=   defPT64    ;
       def6400   :=   defPT6400  ;
       def6401   :=   defPT6401  ;
       def120    :=   defPT120   ;
       def1200   :=   defPT1200  ;
       def12000  :=   defPT12000 ;
       def12001  :=   defPT12001 ;
       def123    :=   defPT123   ;
       def121    :=   defPT121   ;
       def1210   :=   defPT1210  ;
       def122    :=   defPT122   ;
       def12200  :=   defPT12200 ;

       def1220   :=   defPT1220  ;
       def1221   :=   defPT1221  ;
       def1230   :=   defPT1230  ;
       def1240   :=   defPT1240  ;
       def1250   :=   defPT1250  ;
       def1260   :=   defPT1260  ;
       def1270   :=   defPT1270  ;
       def1280   :=   defPT1280  ;

       mensap1   :=   mensPTap1;
       mensap2   :=   mensPTap2;
       mensap3   :=   mensPTap3;
       mensap4   :=   mensPTap4;
       mensap5   :=   mensPTap5;
       mensap6   :=   mensPTap6;
       mens1     :=   mensPT1 ;
       mens2     :=   mensPT2 ;
       mens3     :=   mensPT3 ;
       mens4     :=   mensPT4 ;
       mens5     :=   mensPT5 ;
       mens6     :=   mensPT6 ;
       mens7     :=   mensPT7 ;
       mens8     :=   mensPT8 ;
       mens9     :=   mensPT9 ;
       mens10    :=   mensPT10;
       mens11    :=   mensPT11;
       mens12    :=   mensPT12;
       mens13    :=   mensPT13;
       mens14    :=   mensPT14;
       mens15    :=   mensPT15;
       mens16    :=   mensPT16;
       mens17    :=   mensPT17;
       mens18    :=   mensPT18;
       mens19    :=   mensPT19;
       mens20    :=   mensPT20;
       mens21    :=   mensPT21;
       mens22    :=   mensPT22;
       mens23    :=   mensPT23;
       mens24    :=   mensPT24;
       mens25    :=   mensPT25;
       mens26    :=   mensPT26;
       mens27    :=   mensPT27;
       mens28    :=   mensPT28;
       mens29    :=   mensPT29;
       mens30    :=   mensPT30;
       mens31    :=   mensPT31;
       mens32    :=   mensPT32;
       mens33    :=   mensPT33;
       mens34    :=   mensPT34;
       mens35    :=   mensPT35;
       mens36    :=   mensPT36;
       mens361   :=   mensPT361;
       mens37    :=   mensPT37;
       mens38    :=   mensPT38;
       mens39    :=   mensPT39;
       mens40    :=   mensPT40;
       mens41    :=   mensPT41;
       mens42    :=   mensPT42;
       mens43    :=   mensPT43;
       mens44    :=   mensPT44;
       mens45    :=   mensPT45;
       mens46    :=   mensPT46;
       mens47    :=   mensPT47;
       mens48    :=   mensPT48;
       mens49    :=   mensPT49;
       mens50    :=   mensPT50;
       mens51    :=   mensPT51;
       mens52    :=   mensPT52;
       mens53    :=   mensPT53;
       mens54    :=   mensPT54;
       mens55    :=   mensPT55; 
       mens56    :=   mensPT56;
       mens57    :=   mensPT57;
       mens58    :=   mensPT58;
       mens59    :=   mensPT59;
       mens60    :=   mensPT60;
       mens61    :=   mensPT61;
       mens62    :=   mensPT62;
       mens63    :=   mensPT63;
       mens64    :=   mensPT64;
       mens65    :=   mensPT65; 
       mens66    :=   mensPT66;
       mens67    :=   mensPT67;
       mens68    :=   mensPT68;
       mens69    :=   mensPT69;
       mens70    :=   mensPT70;
       mens71    :=   mensPT71; 
       mens72    :=   mensPT72;
       mens73    :=   mensPT73; 
       mens74    :=   mensPT74;
       mens75    :=   mensPT75;
       mens76    :=   mensPT76;
       mens77    :=   mensPT77;
       mens78    :=   mensPT78;
       mens79    :=   mensPT79; 
       mens80    :=   mensPT80;
       mens81    :=   mensPT81;
       mens82    :=   mensPT82;
       mens83    :=   mensPT83; 
       mens84    :=   mensPT84;
       mens85    :=   mensPT85; 
       mens86    :=   mensPT86;
       mens87    :=   mensPT87;
       mens88    :=   mensPT88;
       mens89    :=   mensPT89;
       mens90    :=   mensPT90;
       mens91    :=   mensPT91;
       mens92    :=   mensPT92;
       mens93    :=   mensPT93;
       mens94    :=   mensPT94;
       mens95    :=   mensPT95;
       mens96    :=   mensPT96;
       mens97    :=   mensPT97;
       mens98    :=   mensPT98;
       mens99    :=   mensPT99;
       mens100   :=   mensPT100;
       mens101   :=   mensPT101;
       mens1010  :=   mensPT1010 ;
       mens102   :=   mensPT102; 
       mens103   :=   mensPT103;
       mens104   :=   mensPT104;
       mens105   :=   mensPT105;
       mens106   :=   mensPT106;
       mens107   :=   mensPT107;
       mens108   :=   mensPT108; 
       mens109   :=   mensPT109;
       mens110   :=   mensPT110;
       mens111   :=   mensPT111;
       mens112   :=   mensPT112;
       mens113   :=   mensPT113;
       mens114   :=   mensPT114; 
       mens115   :=   mensPT115;
       mens116   :=   mensPT116;
       mens117   :=   mensPT117;
       mens118   :=   mensPT118;
       mens119   :=   mensPT119;
       mens120   :=   mensPT120; 
       mens121   :=   mensPT121;
       mens122   :=   mensPT122;
       mens123   :=   mensPT123;
       mens124   :=   mensPT124; 
       mens125   :=   mensPT125;
       mens126   :=   mensPT126;
       mens127   :=   mensPT127;
       mens128   :=   mensPT128;
       mens129   :=   mensPT129;
       mens130   :=   mensPT130;
       mens131   :=   mensPT131;
       mens132   :=   mensPT132;
       mens133   :=   mensPT133;
       mens134   :=   mensPT134;
       mens135   :=   mensPT135;
       mens136   :=   mensPT136;
       mens137   :=   mensPT137;
       mens138   :=   mensPT138;
       mens139   :=   mensPT139;
       mens140   :=   mensPT140;
       mens141   :=   mensPT141;
       mens142   :=   mensPT142;
       mens143   :=   mensPT143;
       mens144   :=   mensPT144;
       mens145   :=   mensPT145;
       mens146   :=   mensPT146;
       mens147   :=   mensPT147;
       mens148   :=   mensPT148;
       mens149   :=   mensPT149;
       mens150   :=   mensPT150;
       mens151   :=   mensPT151;
       mens152   :=   mensPT152;
       mens153   :=   mensPT153;
       mens154   :=   mensPT154;
       mens155   :=   mensPT155;
       mens156   :=   mensPT156;
       mens157   :=   mensPT157;
       mens158   :=   mensPT158;
       mens159   :=   mensPT159;
       mens160   :=   mensPT160;
       mens161   :=   mensPT161;
       mens162   :=   mensPT162;
       mens163   :=   mensPT163;
       mens164   :=   mensPT164;
       mens165   :=   mensPT165;
       mens166   :=   mensPT166;
       mens167   :=   mensPT167;
       mens168   :=   mensPT168;
       mens169   :=   mensPT169;
       mens170   :=   mensPT170;
       mens171   :=   mensPT171;
       mens172   :=   mensPT172;
       mens173   :=   mensPT173;





































































       EI1       :=   EIPT1;
       EI2       :=   EIPT2;
       EI3       :=   EIPT3;
       EI4       :=   EIPT4;
       EI5       :=   EIPT5;
       EI6       :=   EIPT6;
       EI7       :=   EIPT7;
       EI8       :=   EIPT8;
       E19       :=   EPT19;
       E20       :=   EPT20;
       E21       :=   EPT21;


       //ASPECTOS CR�TICOS

       Mensasp1  :=   MensaspPT1;
       Mensasp2  :=   MensaspPT2 ;
       Mensasp3  :=   MensaspPT3;
       Mensasp4  :=   MensaspPT4;
       Mensasp5  :=   MensaspPT5;

      { WTIT[1]   :=   def63 ;
       WTIT[2]   :=   def51 ;
       WTIT[3]   :=   def9 ;
       WTIT[4]   :=   def86 ;
       WTIT[5]   :=   def59 ;
       WTIT[6]   :=   def888 ;
       WTIT[7]   :=   def26 ;
       WTIT[8]   :=   def333 ;
       WTIT[9]   :=   def67 ;
       WTIT[10]  :=   def112 ;
       WTIT[11]  :=   def110 ;
       WTIT[12]  :=   def222 ;
       WTIT[13]  :=   def96 ;
       WTIT[14]  :=   def87 ;
       WTIT[15]  :=   DEF111 ;
       WTIT[16]  :=   DEF23 ; }

       WcLASS [1]:=   dim1 ;
       WcLASS [2]:=   dim2 ;
       WcLASS [3]:=   dim3 ;
       WcLASS [4]:=   dim4 ;
       WcLASS [5]:=   dim5 ;
       WcLASS [6]:=   dim6 ;       
     

 end;


end.
