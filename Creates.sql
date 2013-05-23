-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `case2000`
  CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `case2000`;
-- -------------------------------------
-- Tables

DROP TABLE IF EXISTS `case2000`.`ARI_AREA_INTERESSE`;
CREATE TABLE `case2000`.`ARI_AREA_INTERESSE` (
  `ARI_NOME` VARCHAR(30) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  `ID_AREA` INT(10) NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`BST_VALIDACAO`;
CREATE TABLE `case2000`.`BST_VALIDACAO` (
  `ID` INT(10) NOT NULL AUTO_INCREMENT,
  `IDCLIENTE` INT(10) NULL,
  `VALIDADE` VARCHAR(15) NULL,
  `LIMITE` INT(10) NULL,
  PRIMARY KEY (`ID`),
  INDEX `IDCLIENTE` (`IDCLIENTE`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`CLI_CLIENTE`;
CREATE TABLE `case2000`.`CLI_CLIENTE` (
  `CLI_ID` INT(10) NULL,
  `CLI_RAZ_O_SOCIAL` VARCHAR(60) NULL,
  `CLI_NOME` VARCHAR(60) NULL,
  `CLI_AREA_INTERESSE` VARCHAR(20) NULL,
  `CLI_DIR` VARCHAR(50) NULL,
  `DIR_ALIAS` VARCHAR(30) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`CMB_DIVERSOS`;
CREATE TABLE `case2000`.`CMB_DIVERSOS` (
  `CLI_ID` INT(10) NULL,
  `DI_TIPO` VARCHAR(3) NULL,
  `DI_DESCRICAO` VARCHAR(25) NULL,
  `DI_LING` VARCHAR(2) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  INDEX `CLI_ID` (`CLI_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`COR_OBJETOS`;
CREATE TABLE `case2000`.`COR_OBJETOS` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `PAI_TIPO` VARCHAR(2) NULL,
  `PAI_ID` INT(10) NULL,
  `FILHO_TIPO` VARCHAR(2) NULL,
  `FILHO_ID` INT(10) NULL,
  `COR_DEL` VARCHAR(1) NULL,
  `ATOR_CATEGORIA` VARCHAR(25) NULL,
  `PERC_CUSTO` INT(10) NULL,
  `PERC_CODIGO` INT(10) NULL,
  `PAI_ID_NOVO` INT(10) NULL,
  `FILHO_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  INDEX `i1` (`CLI_ID`, `PRJ_ID`, `PAI_ID`, `PAI_TIPO`, `FILHO_TIPO`),
  INDEX `i2` (`CLI_ID`, `PRJ_ID`, `FILHO_ID`, `FILHO_TIPO`, `PAI_TIPO`),
  INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `PAI_ID`, `PAI_TIPO`, `FILHO_ID`, `FILHO_TIPO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`CUSTO_TEMP`;
CREATE TABLE `case2000`.`CUSTO_TEMP` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `SUB_NOME` VARCHAR(50) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `OBS` VARCHAR(100) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`ELEM_DADO`;
CREATE TABLE `case2000`.`ELEM_DADO` (
  `DE_CODIGO` INT(10) NULL,
  `DE_DESC` VARCHAR(50) NULL,
  `PAI_ID` INT(10) NULL,
  `PAI_TIPO` VARCHAR(2) NULL,
  `PAI_DESC` VARCHAR(50) NULL,
  `PAI_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  INDEX `PAI_ID` (`PAI_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_AC`;
CREATE TABLE `case2000`.`IDF_AC` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_ACAO_CORRETIVA` LONGTEXT NULL,
  `IDF_ALVOS_MELHORIA` LONGTEXT NULL,
  `IDF_NATUREZA` VARCHAR(50) NULL,
  `IDF_NORMALIZE` VARCHAR(1) NULL,
  `IDF_PONTO_DE_VISTA` VARCHAR(50) NULL,
  `IDF_EFEITO` LONGTEXT NULL,
  `IDF_TIPO__ASPECTO` VARCHAR(25) NULL,
  `IDF_ASPECTOS_CRITICOS` LONGTEXT NULL,
  `IDF_STATUS` VARCHAR(20) NULL,
  `IDF_DATA_STATUS` DATETIME NULL,
  `IDF_ENVOLVIDOS` LONGTEXT NULL,
  `IDF_ENTREVISTADOS` LONGTEXT NULL,
  `IDF_EXP_GANHOS` LONGTEXT NULL,
  `DIMENSAO` VARCHAR(25) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `idesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_AP`;
CREATE TABLE `case2000`.`IDF_AP` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_ATIVIDADE_SUMARIA` VARCHAR(1) NULL,
  `IDF_CAUSA_INATIVIDADE` LONGTEXT NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_DURATION_TPU` DOUBLE(15, 5) NULL,
  `IDF_DURATION_TPU1` INT(10) NULL,
  `IDF_DURATION_TPU2` INT(10) NULL,
  `IDF_NATUREZA` VARCHAR(50) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_OBJETIVO_UC` LONGTEXT NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_TEMPO_INATIVO_TPI` DOUBLE(15, 5) NULL,
  `IDF_TIPO` VARCHAR(15) NULL,
  `IDF_TIPO_IMPLEMENT` VARCHAR(30) NULL,
  `IDF_TIPO_UC` VARCHAR(15) NULL,
  `IDF_UNIDADE_TEMPO` VARCHAR(30) NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VALOR_AGREGADO` VARCHAR(14) NULL,
  `IDF_VOLUME` LONGTEXT NULL,
  `IDF_VOLUME_PICO` LONGTEXT NULL,
  `IDF_VOLUME_LOOPING` DOUBLE(15, 5) NULL,
  `IDF_VOLUME_PROC` DOUBLE(15, 5) NULL,
  `IDF_V_PICO` DOUBLE(15, 5) NULL,
  `IDF_V_REGULAR` DOUBLE(15, 5) NULL,
  `IDF_V_MINIMO` DOUBLE(15, 5) NULL,
  `IDF_WBS_CODE` VARCHAR(50) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_REPONSABILIDADE` LONGTEXT NULL,
  `IDF_DE_REPET` INT(10) NULL,
  `IDF_ATOR1` VARCHAR(50) NULL,
  `IDF_ATOR2` VARCHAR(50) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_VOLUME_REG` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_TEC` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_ANUAL` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_GERAL` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_MP` DOUBLE(15, 5) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_TELADIR` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `IDF_DURATION_TPU1` (`IDF_DURATION_TPU1`),
  INDEX `IDF_DURATION_TPU2` (`IDF_DURATION_TPU2`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_CA`;
CREATE TABLE `case2000`.`IDF_CA` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_ACTOR_ROLE` VARCHAR(25) NULL,
  `IDF_EFETIVO_DA_CLASSE` DOUBLE(15, 5) NULL,
  `IDF_ESPECIALIZACAO` LONGTEXT NULL,
  `IDF_FUNCAO_NIVEL` VARCHAR(150) NULL,
  `IDF_JORNADA_PADRAO` DOUBLE(15, 5) NULL,
  `IDF_QUANTIDADE_TURNOS` DOUBLE(15, 5) NULL,
  `IDF_REPONSABILIDADE` LONGTEXT NULL,
  `IDF_COND_TRABALHO` LONGTEXT NULL,
  `IDF_FORMACAO` LONGTEXT NULL,
  `IDF_CONHECIMENTO` LONGTEXT NULL,
  `IDF_EXPERIENCA` LONGTEXT NULL,
  `IDF_COMPETENCIA` LONGTEXT NULL,
  `IDF_USE_CASE_ACTOR_TYPE` VARCHAR(2) NULL,
  `IDF_JORNADA_ANUAL` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_ANUAL` DOUBLE(15, 5) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `idesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_CS`;
CREATE TABLE `case2000`.`IDF_CS` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(30) NULL,
  `IDF_OBJETIVO` VARCHAR(50) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `LCK` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CSSTYLE` VARCHAR(20) NULL,
  `IDF_ANCESTOR` VARCHAR(30) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `IDF_UNIT` VARCHAR(255) NULL,
  `IDF_UNIT_OO` VARCHAR(255) NULL,
  `IDF_DIRPROJ` VARCHAR(255) NULL,
  `IDF_TABELA` VARCHAR(50) NULL,
  `IDF_FORM` VARCHAR(50) NULL,
  `IDF_TABELADT` VARCHAR(50) NULL,
  `IDF_FORMDT` VARCHAR(50) NULL,
  `IDF_UNITDT` VARCHAR(255) NULL,
  `IDF_UNIT_OODT` VARCHAR(255) NULL,
  `IDF_CODIGONOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `IDF_CLASSEPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_CUSTODG`;
CREATE TABLE `case2000`.`IDF_CUSTODG` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `IDF_CUSTO_MO` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_TEC` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_GERAL` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_MP` DOUBLE(15, 5) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_CUSTOS`;
CREATE TABLE `case2000`.`IDF_CUSTOS` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_DADOS`;
CREATE TABLE `case2000`.`IDF_DADOS` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDF_TABELA` VARCHAR(60) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_DATA_TYPE` VARCHAR(60) NULL,
  `IDF_DEFAULT_VALUE` VARCHAR(20) NULL,
  `IDF_DOMINIO` LONGTEXT NULL,
  `IDF_NAMING_PREFIX` VARCHAR(8) NULL,
  `IDF_NATUREZA` VARCHAR(50) NULL,
  `IDF_NORMALIZE` VARCHAR(1) NULL,
  `IDF_TYPE_QUALIFIERS` VARCHAR(20) NULL,
  `IDF_DE_REPET` INT(10) NULL,
  `IDF_PK` INT(10) NULL,
  `IDF_SEQ` INT(10) NULL,
  `IDF_OBRIG` VARCHAR(1) NULL,
  `IDF_CAPTION` VARCHAR(40) NULL,
  `IDF_DECIMAL` INT(10) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDF_TIPODOMINIO` VARCHAR(1) NULL,
  `IDF_TABREF` VARCHAR(50) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`, `IDF_TABELA`, `IDF_SEQ`),
  INDEX `IDF_CAPTION` (`IDF_CAPTION`),
  INDEX `IDF_DATA_TYPE` (`IDF_DATA_TYPE`),
  INDEX `IDF_DE_REPET` (`IDF_DE_REPET`),
  INDEX `IDF_DEFAULT_VALUE` (`IDF_DEFAULT_VALUE`),
  INDEX `IDF_DEL` (`IDF_DEL`),
  INDEX `IDF_DESIGNACAO` (`IDF_DESIGNACAO`),
  INDEX `IDF_NAMING_PREFIX` (`IDF_NAMING_PREFIX`),
  INDEX `IDF_NATUREZA` (`IDF_NATUREZA`),
  INDEX `IDF_NOME` (`IDF_NOME`),
  INDEX `IDF_NORMALIZE` (`IDF_NORMALIZE`),
  INDEX `IDF_PK` (`IDF_PK`),
  INDEX `IDF_TIPO` (`IDF_OBRIG`),
  INDEX `IDF_TYPE_QUALIFIERS` (`IDF_TYPE_QUALIFIERS`),
  INDEX `IDF_VISIBLE` (`IDF_VISIBLE`),
  INDEX `xWA_Sys_IDF_CODIGO_3E52440B` (`IDF_CODIGO`),
  INDEX `xWA_Sys_IDF_TABELA_3E52440B` (`IDF_TABELA`),
  INDEX `xWA_Sys_PRJ_ID_3E52440B` (`PRJ_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_DE`;
CREATE TABLE `case2000`.`IDF_DE` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_CONSTRAINT_NAME` VARCHAR(31) NULL,
  `IDF_DATA_TYPE` VARCHAR(60) NULL,
  `IDF_DEFAULT_VALUE` VARCHAR(20) NULL,
  `IDF_DOMINIO` LONGTEXT NULL,
  `IDF_NAMING_PREFIX` VARCHAR(8) NULL,
  `IDF_NATUREZA` VARCHAR(50) NULL,
  `IDF_NORMALIZE` VARCHAR(1) NULL,
  `IDF_TYPE_QUALIFIERS` VARCHAR(20) NULL,
  `IDF_DE_REPET` INT(10) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  `IDF_UNIDADE_TEMPO` VARCHAR(255) NULL,
  `IDF_MEDIA` VARCHAR(255) NULL,
  `IDF_VOLUME_PROC` VARCHAR(255) NULL,
  `IDF_DIRETORIO` VARCHAR(255) NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `i1` (`CLI_ID`, `PRJ_ID`, `SUB_NIVEL`),
  INDEX `iDesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`),
  INDEX `IDF_DIRETORIO` (`IDF_DIRETORIO`),
  INDEX `IDF_MEDIA` (`IDF_MEDIA`),
  INDEX `IDF_UNIDADE_TEMPO` (`IDF_UNIDADE_TEMPO`),
  INDEX `IDF_VOLUME_PROC` (`IDF_VOLUME_PROC`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_DG`;
CREATE TABLE `case2000`.`IDF_DG` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_MEDIA` VARCHAR(30) NULL,
  `IDF_UNIDADE_TEMPO` VARCHAR(30) NULL,
  `IDF_VOLUME_PROC` DOUBLE(15, 5) NULL,
  `IDF_VOLUME_PROC1` INT(10) NULL,
  `IDF_VOLUME_PROC2` INT(10) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  `IDF_DG` VARCHAR(255) NULL,
  UNIQUE INDEX `iprim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `iDesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`),
  INDEX `IDF_DG` (`IDF_DG`),
  INDEX `IDF_VOLUME_PROC1` (`IDF_VOLUME_PROC1`),
  INDEX `IDF_VOLUME_PROC2` (`IDF_VOLUME_PROC2`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_EN`;
CREATE TABLE `case2000`.`IDF_EN` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_PERIOD_EVENTO_TEMPORA` VARCHAR(30) NULL,
  `IDF_PRE_REQUISITOS` LONGTEXT NULL,
  `IDF_TIPO` VARCHAR(15) NULL,
  `IDF_TIPO_IMPLEMENT` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iprim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `idesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_ET`;
CREATE TABLE `case2000`.`IDF_ET` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `CLASS_ID` INT(10) NULL,
  `EVE_NOME` VARCHAR(60) NULL,
  `EVE_TYPE` VARCHAR(40) NULL,
  `EVE_COMENT` VARCHAR(200) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESIGNACAO` VARCHAR(30) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_OBJETIVO` VARCHAR(50) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_SEQ` INT(10) NULL,
  `EVE_VISIBIL` VARCHAR(20) NULL,
  `LCK` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CAT` VARCHAR(20) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `IDF_EVENTOSPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`, `CLASS_ID`, `IDF_SEQ`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_EV`;
CREATE TABLE `case2000`.`IDF_EV` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_MINIESPECIFICACAO` LONGTEXT NULL,
  `IDF_TELADIR` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `idesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_IF`;
CREATE TABLE `case2000`.`IDF_IF` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(50) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_MEDIA` VARCHAR(30) NULL,
  `IDF_UNIDADE_TEMPO` VARCHAR(30) NULL,
  `IDF_VOLUME_PROC` DOUBLE(15, 5) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  `IDF_DOMINIO` VARCHAR(100) NULL,
  `IDF_TIPODOMINIO` VARCHAR(100) NULL,
  `IDF_TABREF` VARCHAR(100) NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `iDesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`),
  INDEX `IDF_DOMINIO` (`IDF_DOMINIO`),
  INDEX `IDF_TABREF` (`IDF_TABREF`),
  INDEX `IDF_TIPODOMINIO` (`IDF_TIPODOMINIO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_JU`;
CREATE TABLE `case2000`.`IDF_JU` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_LOGICA` VARCHAR(3) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_LF`;
CREATE TABLE `case2000`.`IDF_LF` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_LOCALIZACAO_FISICA` VARCHAR(100) NULL,
  `IDF_CUSTOAMBIENTE` DOUBLE(15, 5) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  `IDF_UNIDADE_TEMPO` VARCHAR(255) NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `IDF_UNIDADE_TEMPO` (`IDF_UNIDADE_TEMPO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_LIMPA`;
CREATE TABLE `case2000`.`IDF_LIMPA` (
  `CODIGO` INT(10) NULL,
  `TIPO` VARCHAR(2) NULL,
  `DESIGNACAO` VARCHAR(255) NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_MT`;
CREATE TABLE `case2000`.`IDF_MT` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `CLASS_ID` INT(10) NULL,
  `MET_NOME` VARCHAR(30) NULL,
  `MET_VISIBIL` VARCHAR(20) NULL,
  `MET_COMENT` VARCHAR(200) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESIGNACAO` VARCHAR(30) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_OBJETIVO` VARCHAR(50) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_SEQ` INT(10) NULL,
  `LCK` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CAT` VARCHAR(20) NULL,
  `IDF_METTYPE` VARCHAR(20) NULL,
  `IDF_METBIND` VARCHAR(20) NULL,
  `IDF_METDIRECT` VARCHAR(20) NULL,
  `IDF_TIPO` VARCHAR(25) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `IDF_METODOSPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`, `CLASS_ID`, `IDF_SEQ`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_OE`;
CREATE TABLE `case2000`.`IDF_OE` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_DATABASE` VARCHAR(15) NULL,
  `IDF_DBDIR` VARCHAR(40) NULL,
  `IDF_DBTYPE` VARCHAR(20) NULL,
  `IDF_SYSTEMTABLE` VARCHAR(30) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_OI`;
CREATE TABLE `case2000`.`IDF_OI` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_DISTRIBUICAO` VARCHAR(15) NULL,
  `IDF_MINIESPECIFICACAO` LONGTEXT NULL,
  `IDF_NAMING_PREFIX` VARCHAR(8) NULL,
  `IDF_DE_REPET` INT(10) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_TELADIR` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_PESSOA`;
CREATE TABLE `case2000`.`IDF_PESSOA` (
  `ID_PESSOA` INT(10) NULL,
  `DATATU` DATETIME NULL,
  `ID_USUARIO` INT(10) NULL,
  `PES_NOME` VARCHAR(30) NULL,
  `PES_SENHA` VARCHAR(30) NULL,
  `USUARIO` VARCHAR(30) NULL,
  UNIQUE INDEX `I0_PESSOA` (`ID_PESSOA`),
  INDEX `iUSUPESS` (`ID_USUARIO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_PR`;
CREATE TABLE `case2000`.`IDF_PR` (
  `CLI_ID` INT(10) NOT NULL,
  `PRJ_ID` INT(10) NOT NULL,
  `IDF_CODIGO` INT(10) NOT NULL,
  `IDF_SEQ` INT(10) NOT NULL,
  `PR_DESCRICAO` LONGTEXT NULL,
  `PR_NOME` VARCHAR(50) NULL,
  `PR_TIPO` VARCHAR(25) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_METODO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  PRIMARY KEY (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`, `IDF_SEQ`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_PRIVILEGIOS`;
CREATE TABLE `case2000`.`IDF_PRIVILEGIOS` (
  `ID_PRIV` INT(10) NULL,
  `DATATU` DATETIME NULL,
  `ID_USECASE` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `ID_USUARIO` INT(10) NULL,
  `USUARIO` VARCHAR(30) NULL,
  `ACESSO` VARCHAR(40) NULL,
  `PRV_DESCRICAO` VARCHAR(50) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `NIVEIS_ABAIXO` VARCHAR(1) NULL,
  UNIQUE INDEX `I0_PRIVILEGIOS` (`ID_PRIV`),
  INDEX `iPRIVCLI` (`CLI_ID`, `PRJ_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_PS`;
CREATE TABLE `case2000`.`IDF_PS` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_CARGO` VARCHAR(60) NULL,
  `IDF_CLASSIFICACAO_PP` VARCHAR(10) NULL,
  `IDF_COMPLEXIDADE` VARCHAR(14) NULL,
  `IDF_CUSTO_ANUAL` DOUBLE(15, 5) NULL,
  `IDF_ESTADO` VARCHAR(60) NULL,
  `IDF_TEMPO_CONTRATACAO` INT(10) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `PS_MAIL` VARCHAR(60) NULL,
  `PS_CELULAR` VARCHAR(30) NULL,
  `PS_TEL` VARCHAR(30) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_PY`;
CREATE TABLE `case2000`.`IDF_PY` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `CLASS_ID` INT(10) NULL,
  `PROP_TIPO` VARCHAR(25) NULL,
  `PROP_DEFAULT` VARCHAR(30) NULL,
  `PROP_VISIBIL` VARCHAR(20) NULL,
  `PROP_DOMINIO` VARCHAR(150) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VISIBLE` VARCHAR(20) NULL,
  `IDF_SEQ` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(30) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_OBJETIVO` VARCHAR(50) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `LCK` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CAT` VARCHAR(20) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `IDF_LISTA` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `IDF_PROPERTYPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`, `CLASS_ID`, `IDF_SEQ`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_RN`;
CREATE TABLE `case2000`.`IDF_RN` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_USE_CASE_ACTOR_TYPE` VARCHAR(2) NULL,
  `IDF_REGRA_EXCECAO` LONGTEXT NULL,
  `IDF_FORMALIZACAO` VARCHAR(1) NULL,
  `IDF_TIPO_IMPLEMENT` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`),
  INDEX `iDesc` (`CLI_ID`, `PRJ_ID`, `IDF_DESIGNACAO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_SE`;
CREATE TABLE `case2000`.`IDF_SE` (
  `IDF_CODIGO` INT(10) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` SMALLINT(5) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_ID` INT(10) NULL,
  `IDF_ID_FISICO` INT(10) NULL,
  `IDF_OI` INT(10) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_CLASSEOBJETO` VARCHAR(3) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `SUB_NIVEL` SMALLINT(5) NULL,
  `IDF_NOME` VARCHAR(60) NULL,
  `SUB_ID` INT(10) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_TIPO_ATIV` VARCHAR(16) NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_OBJETIVO` LONGTEXT NULL,
  `IDF_UPDATE_DATE` DATETIME NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DESCRICAO` LONGTEXT NULL,
  `IDF_SIGLA` VARCHAR(120) NULL,
  `IDF_CUSTO_TEC` DOUBLE(15, 5) NULL,
  `IDF_COD_APLIC` INT(10) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_TODO`;
CREATE TABLE `case2000`.`IDF_TODO` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `TODO_DATA` DATETIME NULL,
  `IDF_DESCRICAO` VARCHAR(255) NULL,
  `TODO_STATUS` VARCHAR(20) NULL,
  `TODO_REP` VARCHAR(30) NULL,
  `TODO_CAT` VARCHAR(30) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  INDEX `IDF_TODOPRIM` (`CLI_ID`, `PRJ_ID`, `IDF_CODIGO`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_TX`;
CREATE TABLE `case2000`.`IDF_TX` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `IDF_DESIGNACAO` VARCHAR(50) NULL,
  `IDF_OBJETIVO` VARCHAR(50) NULL,
  `IDF_BD` VARCHAR(30) NULL,
  `IDF_FORNECEDOR` VARCHAR(50) NULL,
  `IDF_IMPLANTACAO` DATETIME NULL,
  `IDF_CUSTO_LIC` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_MANUT` DOUBLE(15, 5) NULL,
  `IDF_CUSTO_OUTROS` DOUBLE(15, 5) NULL,
  `IDF_TIPO_ATIVIDADE` VARCHAR(16) NULL,
  `IDF_VISIBLE` VARCHAR(1) NULL,
  `IDF_DEL` VARCHAR(1) NULL,
  `IDG_ID` INT(10) NULL,
  `LCK` VARCHAR(1) NULL,
  `IDF_VERSAO` VARCHAR(6) NULL,
  `IDF_VERSAO_DATA` DATETIME NULL,
  `IDF_RESPONSAVEL` VARCHAR(30) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_USECASE`;
CREATE TABLE `case2000`.`IDF_USECASE` (
  `ID_USECASE` INT(10) NOT NULL,
  `DATATU` DATETIME NULL,
  `UC_NOME` VARCHAR(30) NULL,
  `GRUPO` VARCHAR(30) NULL,
  `US_DESCRICAO` VARCHAR(50) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `UC_LING` VARCHAR(2) NULL,
  PRIMARY KEY (`ID_USECASE`),
  UNIQUE INDEX `iUc` (`UC_NOME`, `UC_LING`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDF_USUARIO`;
CREATE TABLE `case2000`.`IDF_USUARIO` (
  `ID_USUARIO` INT(10) NULL,
  `DATATU` DATETIME NULL,
  `US_NOME` VARCHAR(30) NULL,
  `USUARIO` VARCHAR(30) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  UNIQUE INDEX `IO_USUARIO` (`ID_USUARIO`),
  INDEX `iCLI` (`CLI_ID`, `PRJ_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`IDG_CLASS`;
CREATE TABLE `case2000`.`IDG_CLASS` (
  `IDG_ID` VARCHAR(5) NULL,
  `IDG_DESC` VARCHAR(30) NULL,
  `IDG_PALETTE` VARCHAR(20) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`PRJ_PROJETO`;
CREATE TABLE `case2000`.`PRJ_PROJETO` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `PRJ_STATUS` VARCHAR(20) NULL,
  `PRJ_TITULO` VARCHAR(100) NULL,
  `PRJ_CLIENTE` VARCHAR(50) NULL,
  `PRJ_AREA_INTERESSE` VARCHAR(20) NULL,
  `PRJ_OBJETIVO` LONGTEXT NULL,
  `PRJ_PREMISSAS` LONGTEXT NULL,
  `PRJ_RESTRICOES` LONGTEXT NULL,
  `PRJ_EXPECTATIVA_GANHO` LONGTEXT NULL,
  `PRJ_ALVOS_MELHORIA` LONGTEXT NULL,
  `PRJ_CARATER_RELEVANTE` LONGTEXT NULL,
  `PRJ_DEFINICAO_CONTEXTO` LONGTEXT NULL,
  `PRJ_EQUIPE_PROJETO` LONGTEXT NULL,
  `PRJ_FATORES_RESTRITIVOS` LONGTEXT NULL,
  `PRJ_CARGA_HORA_DEMANDADA` DOUBLE(15, 5) NULL,
  `PRJ_COMPLEXIDADE` VARCHAR(14) NULL,
  `PRJ_QTDE_NECES_PROCES` DOUBLE(15, 5) NULL,
  `PRJ_PATROCINADOR` VARCHAR(50) NULL,
  `PRJ_DATA_INICIO` DATETIME NULL,
  `PRJ_DATA_FIM_PLANEJADA` DATETIME NULL,
  `PRJ_PATH` VARCHAR(50) NULL,
  `PRJ_CAMINHO` VARCHAR(60) NULL,
  `IDF_DIRETORIO` VARCHAR(250) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`PROVIDER_DATA`;
CREATE TABLE `case2000`.`PROVIDER_DATA` (
  `PROVIDER` VARCHAR(50) NULL,
  `TYPE_NAME` VARCHAR(60) NULL,
  `DATA_TYPE` INT(10) NULL,
  `COLUMN_SIZE` INT(10) NULL,
  `LCK` VARCHAR(1) NULL,
  `TIPO` VARCHAR(1) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  INDEX `i1` (`PROVIDER`),
  INDEX `xWA_Sys_COLUMN_SIZE_0EA330E9` (`COLUMN_SIZE`),
  INDEX `xWA_Sys_DATA_TYPE_0EA330E9` (`DATA_TYPE`),
  INDEX `xWA_Sys_LCK_0EA330E9` (`LCK`),
  INDEX `xWA_Sys_TIPO_0EA330E9` (`TIPO`),
  INDEX `xWA_Sys_TYPE_NAME_0EA330E9` (`TYPE_NAME`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`REQUERIMENTOS`;
CREATE TABLE `case2000`.`REQUERIMENTOS` (
  `SEQ` INT(10) NOT NULL,
  `SUBSEQ` INT(10) NOT NULL,
  `WBS` VARCHAR(50) NULL,
  `OPERACAO` VARCHAR(255) NULL,
  `OBJETIVOUC` LONGTEXT NULL,
  `PROCESSO` VARCHAR(50) NULL,
  `DESC_PROCESSO` LONGTEXT NULL,
  `CATEGORIA` VARCHAR(50) NULL,
  `REQUERIMENTO` VARCHAR(255) NULL,
  `ADERENCIA` VARCHAR(50) NULL,
  `COMENTARIOS` LONGTEXT NULL,
  `PONTOS` DECIMAL(18, 0) NULL,
  `AVALIACAO` VARCHAR(50) NULL,
  `PRODUTOS` VARCHAR(255) NULL,
  `REGRA` VARCHAR(255) NULL,
  `DESC_REGRA` LONGTEXT NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  PRIMARY KEY (`SEQ`, `SUBSEQ`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`SUB_SUBORDINACAO`;
CREATE TABLE `case2000`.`SUB_SUBORDINACAO` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDG_ID` INT(10) NULL,
  `SUB_ID` INT(10) NULL,
  `DIAG_PAI_ID` INT(10) NULL,
  `SUB_NOME` VARCHAR(50) NULL,
  `DIAG_ID` VARCHAR(50) NULL,
  `ATIVIDADE_MAE` INT(10) NULL,
  `GRID_ALT` SMALLINT(5) NULL,
  `GRID_LARG` SMALLINT(5) NULL,
  `GRID_COR` DOUBLE(15, 5) NULL,
  `GRID_SHOW` SMALLINT(5) NULL,
  `GRID_SNAP` VARCHAR(1) NULL,
  `IDG_DIR` VARCHAR(40) NULL,
  `IDG_NIVEL` INT(10) NULL,
  `IDG_UPDATEDATE` DATETIME NULL,
  `IDG_DIAGRAM_STATUS` VARCHAR(12) NULL,
  `IDG_IDGCLASS` VARCHAR(5) NULL,
  `IDG_DIAG` LONGTEXT NULL,
  `IDG_ID_NOVO` INT(10) NULL,
  `DIAG_ID_NOVO` VARCHAR(50) NULL,
  `DIAG_PAI_ID_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `iPrim` (`CLI_ID`, `PRJ_ID`, `IDG_ID`, `DIAG_PAI_ID`),
  INDEX `IDG_DIAG` (`IDG_DIAG`(45))
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`TI_ADERENCIA`;
CREATE TABLE `case2000`.`TI_ADERENCIA` (
  `AD_FORNECEDOR` VARCHAR(50) NULL,
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `TI_CODIGO` INT(10) NULL,
  `AD_AP_AVAL` VARCHAR(150) NULL,
  `AD_AP_ADER` DOUBLE(15, 5) NULL,
  `AD_RN_AVAL` VARCHAR(150) NULL,
  `AD_RN_ADER` DOUBLE(15, 5) NULL,
  `AD_PG_AVAL` VARCHAR(150) NULL,
  `AD_PG_ADER` DOUBLE(15, 5) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`TI_LAY`;
CREATE TABLE `case2000`.`TI_LAY` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `LAY_OI` INT(10) NULL,
  `LAY_ESTR` VARCHAR(1) NULL,
  `LAY_DE` VARCHAR(50) NULL,
  `LAY_CONSULTA` VARCHAR(1) NULL,
  `LAY_EDICAO` VARCHAR(1) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `case2000`.`TI_REQ`;
CREATE TABLE `case2000`.`TI_REQ` (
  `CLI_ID` INT(10) NULL,
  `PRJ_ID` INT(10) NULL,
  `IDF_CODIGO` INT(10) NULL,
  `TI_CODIGO` INT(10) NULL,
  `TI_REQ_AP` VARCHAR(255) NULL,
  `TI_PESO_AP` INT(10) NULL,
  `TI_REQ_RN` VARCHAR(255) NULL,
  `TI_PESO_RN` INT(10) NULL,
  `TI_REQ_PG` VARCHAR(255) NULL,
  `TI_PESO_PG` INT(10) NULL,
  `TI_SEQ` INT(10) NULL,
  `TI_ALTERNATE` LONGTEXT NULL,
  `IDF_CODIGO_NOVO` INT(10) NULL,
  `TI_CODIGO_NOVO` INT(10) NULL,
  `USUARIO` VARCHAR(20) NULL,
  `DATATU` DATETIME NULL,
  UNIQUE INDEX `tiprim` (`CLI_ID`, `PRJ_ID`, `TI_CODIGO`, `TI_SEQ`, `IDF_CODIGO`)
)
ENGINE = INNODB;



SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF
