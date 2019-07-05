-- MySQL Script generated by MySQL Workbench
-- Wed Jul  3 15:55:46 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `enderecoCompleto` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`enderecoCompleto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `cpf` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `email` VARCHAR(100) NULL,
  `foto` MEDIUMBLOB NOT NULL,
  `endereco_idendereco` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_pessoa_endereco1_idx` (`endereco_idendereco` ASC) ,
  CONSTRAINT `fk_pessoa_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `mydb`.`endereco` (`enderecoCompleto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instrutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`instrutor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`instrutor` (
  `data_contrata` DATE NOT NULL,
  `pessoa_cpf` VARCHAR(45) NOT NULL,
  `data_demite` DATE NULL,
  PRIMARY KEY (`pessoa_cpf`),
  INDEX `fk_table2_pessoa_idx` (`pessoa_cpf` ASC) ,
  CONSTRAINT `fk_table2_pessoa`
    FOREIGN KEY (`pessoa_cpf`)
    REFERENCES `mydb`.`pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`escoteiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`escoteiro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`escoteiro` (
  `ativo` TINYINT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `nivel` INT NOT NULL,
  `pessoa_cpf` VARCHAR(45) NOT NULL,
  INDEX `fk_escoteiro_pessoa1_idx` (`pessoa_cpf` ASC) ,
  PRIMARY KEY (`pessoa_cpf`),
  CONSTRAINT `fk_escoteiro_pessoa1`
    FOREIGN KEY (`pessoa_cpf`)
    REFERENCES `mydb`.`pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`administrador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`administrador` (
  `pessoa_cpf` VARCHAR(45) NOT NULL,
  `data_inic` DATE NOT NULL,
  `data_saida` DATE NULL,
  INDEX `fk_administrador_pessoa1_idx` (`pessoa_cpf` ASC) ,
  PRIMARY KEY (`pessoa_cpf`),
  CONSTRAINT `fk_administrador_pessoa1`
    FOREIGN KEY (`pessoa_cpf`)
    REFERENCES `mydb`.`pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`doencaCronica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`doencaCronica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`doencaCronica` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`escoteiro_has_doencaCronica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`escoteiro_has_doencaCronica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`escoteiro_has_doencaCronica` (
  `escoteiro_pessoa_cpf` VARCHAR(45) NOT NULL,
  `doencaCronica_id` INT NOT NULL,
  PRIMARY KEY (`escoteiro_pessoa_cpf`, `doencaCronica_id`),
  INDEX `fk_escoteiro_has_doencaCronica_doencaCronica1_idx` (`doencaCronica_id` ASC) ,
  INDEX `fk_escoteiro_has_doencaCronica_escoteiro1_idx` (`escoteiro_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_escoteiro_has_doencaCronica_escoteiro1`
    FOREIGN KEY (`escoteiro_pessoa_cpf`)
    REFERENCES `mydb`.`escoteiro` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escoteiro_has_doencaCronica_doencaCronica1`
    FOREIGN KEY (`doencaCronica_id`)
    REFERENCES `mydb`.`doencaCronica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Evento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `idEvento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `administrador_pessoa_cpf` VARCHAR(45) NOT NULL,
  `inicio` DATE NOT NULL,
  `fim` DATE NOT NULL,
  PRIMARY KEY (`idEvento`),
  INDEX `fk_Evento_administrador1_idx` (`administrador_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_Evento_administrador1`
    FOREIGN KEY (`administrador_pessoa_cpf`)
    REFERENCES `mydb`.`administrador` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipoAtividade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipoAtividade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipoAtividade` (
  `idtipoAtividade` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`idtipoAtividade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`local`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`local` ;

CREATE TABLE IF NOT EXISTS `mydb`.`local` (
  `idlocal` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlocal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atividade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`atividade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`atividade` (
  `idatividade` INT NOT NULL,
  `tipoAtividade_idtipoAtividade` INT NOT NULL,
  `Evento_idEvento` INT NULL,
  `inicio` VARCHAR(100) NOT NULL,
  `termino` VARCHAR(100) NOT NULL,
  `local_idlocal` INT NOT NULL,
  PRIMARY KEY (`idatividade`),
  INDEX `fk_atividade_tipoAtividade1_idx` (`tipoAtividade_idtipoAtividade` ASC) ,
  INDEX `fk_atividade_Evento1_idx` (`Evento_idEvento` ASC) ,
  INDEX `fk_atividade_local1_idx` (`local_idlocal` ASC) ,
  CONSTRAINT `fk_atividade_tipoAtividade1`
    FOREIGN KEY (`tipoAtividade_idtipoAtividade`)
    REFERENCES `mydb`.`tipoAtividade` (`idtipoAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividade_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividade_local1`
    FOREIGN KEY (`local_idlocal`)
    REFERENCES `mydb`.`local` (`idlocal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instrutor_administra_atividade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`instrutor_administra_atividade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`instrutor_administra_atividade` (
  `instrutor_pessoa_cpf` VARCHAR(45) NOT NULL,
  `atividade_idatividade` INT NOT NULL,
  PRIMARY KEY (`instrutor_pessoa_cpf`, `atividade_idatividade`),
  INDEX `fk_instrutor_has_atividade_atividade1_idx` (`atividade_idatividade` ASC) ,
  INDEX `fk_instrutor_has_atividade_instrutor1_idx` (`instrutor_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_instrutor_has_atividade_instrutor1`
    FOREIGN KEY (`instrutor_pessoa_cpf`)
    REFERENCES `mydb`.`instrutor` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrutor_has_atividade_atividade1`
    FOREIGN KEY (`atividade_idatividade`)
    REFERENCES `mydb`.`atividade` (`idatividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`escoteiro_participa_atividade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`escoteiro_participa_atividade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`escoteiro_participa_atividade` (
  `escoteiro_pessoa_cpf` VARCHAR(45) NOT NULL,
  `atividade_idatividade` INT NOT NULL,
  PRIMARY KEY (`escoteiro_pessoa_cpf`, `atividade_idatividade`),
  INDEX `fk_escoteiro_has_atividade_atividade1_idx` (`atividade_idatividade` ASC) ,
  INDEX `fk_escoteiro_has_atividade_escoteiro1_idx` (`escoteiro_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_escoteiro_has_atividade_escoteiro1`
    FOREIGN KEY (`escoteiro_pessoa_cpf`)
    REFERENCES `mydb`.`escoteiro` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escoteiro_has_atividade_atividade1`
    FOREIGN KEY (`atividade_idatividade`)
    REFERENCES `mydb`.`atividade` (`idatividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipoEq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipoEq` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipoEq` (
  `idtipoEq` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idtipoEq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`compra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `idcompra` INT NOT NULL,
  `data` DATE NOT NULL,
  `administrador_pessoa_cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcompra`),
  INDEX `fk_compra_administrador1_idx` (`administrador_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_compra_administrador1`
    FOREIGN KEY (`administrador_pessoa_cpf`)
    REFERENCES `mydb`.`administrador` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`equipamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`equipamento` (
  `idequipamento` INT NOT NULL AUTO_INCREMENT,
  `tipoEq_idtipoEq` INT NOT NULL,
  `compra_idcompra` INT NOT NULL,
  PRIMARY KEY (`idequipamento`),
  INDEX `fk_equipamento_tipoEq1_idx` (`tipoEq_idtipoEq` ASC) ,
  INDEX `fk_equipamento_compra1_idx` (`compra_idcompra` ASC) ,
  CONSTRAINT `fk_equipamento_tipoEq1`
    FOREIGN KEY (`tipoEq_idtipoEq`)
    REFERENCES `mydb`.`tipoEq` (`idtipoEq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamento_compra1`
    FOREIGN KEY (`compra_idcompra`)
    REFERENCES `mydb`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atividade_has_equipamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`atividade_has_equipamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`atividade_has_equipamento` (
  `atividade_idatividade` INT NOT NULL,
  `equipamento_idequipamento` INT NOT NULL,
  PRIMARY KEY (`atividade_idatividade`, `equipamento_idequipamento`),
  INDEX `fk_atividade_has_equipamento_equipamento1_idx` (`equipamento_idequipamento` ASC) ,
  INDEX `fk_atividade_has_equipamento_atividade1_idx` (`atividade_idatividade` ASC) ,
  CONSTRAINT `fk_atividade_has_equipamento_atividade1`
    FOREIGN KEY (`atividade_idatividade`)
    REFERENCES `mydb`.`atividade` (`idatividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividade_has_equipamento_equipamento1`
    FOREIGN KEY (`equipamento_idequipamento`)
    REFERENCES `mydb`.`equipamento` (`idequipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`administrador_descarta_equipamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`administrador_descarta_equipamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`administrador_descarta_equipamento` (
  `administrador_pessoa_cpf` VARCHAR(45) NOT NULL,
  `equipamento_idequipamento` INT NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`administrador_pessoa_cpf`, `equipamento_idequipamento`),
  INDEX `fk_administrador_has_equipamento_equipamento1_idx` (`equipamento_idequipamento` ASC) ,
  INDEX `fk_administrador_has_equipamento_administrador1_idx` (`administrador_pessoa_cpf` ASC) ,
  CONSTRAINT `fk_administrador_has_equipamento_administrador1`
    FOREIGN KEY (`administrador_pessoa_cpf`)
    REFERENCES `mydb`.`administrador` (`pessoa_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrador_has_equipamento_equipamento1`
    FOREIGN KEY (`equipamento_idequipamento`)
    REFERENCES `mydb`.`equipamento` (`idequipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra_has_tipoEq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`compra_has_tipoEq` ;

CREATE TABLE IF NOT EXISTS `mydb`.`compra_has_tipoEq` (
  `compra_idcompra` INT NOT NULL,
  `tipoEq_idtipoEq` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`compra_idcompra`, `tipoEq_idtipoEq`),
  INDEX `fk_compra_has_tipoEq_tipoEq1_idx` (`tipoEq_idtipoEq` ASC) ,
  INDEX `fk_compra_has_tipoEq_compra1_idx` (`compra_idcompra` ASC) ,
  CONSTRAINT `fk_compra_has_tipoEq_compra1`
    FOREIGN KEY (`compra_idcompra`)
    REFERENCES `mydb`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_tipoEq_tipoEq1`
    FOREIGN KEY (`tipoEq_idtipoEq`)
    REFERENCES `mydb`.`tipoEq` (`idtipoEq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `numero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone_has_pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefone_has_pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefone_has_pessoa` (
  `telefone_numero` VARCHAR(20) NOT NULL,
  `pessoa_cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefone_numero`, `pessoa_cpf`),
  INDEX `fk_telefone_has_pessoa_pessoa1_idx` (`pessoa_cpf` ASC) ,
  INDEX `fk_telefone_has_pessoa_telefone1_idx` (`telefone_numero` ASC) ,
  CONSTRAINT `fk_telefone_has_pessoa_telefone1`
    FOREIGN KEY (`telefone_numero`)
    REFERENCES `mydb`.`telefone` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_has_pessoa_pessoa1`
    FOREIGN KEY (`pessoa_cpf`)
    REFERENCES `mydb`.`pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
