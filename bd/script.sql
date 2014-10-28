SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sitap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sitap` ;

-- -----------------------------------------------------
-- Table `sitap`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `senha` VARCHAR(45) NULL ,
  `sexo` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `endereco` VARCHAR(45) NULL ,
  `cep` VARCHAR(45) NULL ,
  `foto` VARCHAR(45) NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`artigo` (
  `idartigo` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NULL ,
  `corpo` TEXT NULL ,
  `data` DATETIME NULL ,
  `idusuario` INT NOT NULL ,
  `like` INT NULL COMMENT 'Quantidade de curtidas que o artigo recebe.' ,
  PRIMARY KEY (`idartigo`) ,
  INDEX `fk_artigo_usuario1` (`idusuario` ASC) ,
  CONSTRAINT `fk_artigo_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`comentario` (
  `idcomentario` INT NOT NULL AUTO_INCREMENT ,
  `idusuario` INT NOT NULL ,
  `idartigo` INT NOT NULL ,
  `corpo` VARCHAR(45) NULL ,
  `data` DATETIME NULL ,
  INDEX `fk_usuario_has_artigo_artigo1` (`idartigo` ASC) ,
  INDEX `fk_usuario_has_artigo_usuario` (`idusuario` ASC) ,
  PRIMARY KEY (`idcomentario`) ,
  CONSTRAINT `fk_usuario_has_artigo_usuario`
    FOREIGN KEY (`idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artigo_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `sitap`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`foto` (
  `idfoto` INT NOT NULL AUTO_INCREMENT ,
  `arquivo` VARCHAR(45) NULL ,
  `idartigo` INT NOT NULL ,
  PRIMARY KEY (`idfoto`) ,
  INDEX `fk_foto_artigo1` (`idartigo` ASC) ,
  CONSTRAINT `fk_foto_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `sitap`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `descricao` VARCHAR(100) NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categoria_has_artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categoria_has_artigo` (
  `idcategoria` INT NOT NULL ,
  `idartigo` INT NOT NULL ,
  PRIMARY KEY (`idcategoria`, `idartigo`) ,
  INDEX `fk_categoria_has_artigo_artigo1` (`idartigo` ASC) ,
  INDEX `fk_categoria_has_artigo_categoria1` (`idcategoria` ASC) ,
  CONSTRAINT `fk_categoria_has_artigo_categoria1`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `sitap`.`categoria` (`idcategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_artigo_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `sitap`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
