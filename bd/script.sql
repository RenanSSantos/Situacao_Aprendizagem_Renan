SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL ,
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
-- Table `mydb`.`artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`artigo` (
  `idartigo` INT NOT NULL ,
  `titulo` VARCHAR(45) NULL ,
  `corpo` TEXT NULL ,
  `data` DATETIME NULL ,
  `idusuario` INT NOT NULL ,
  PRIMARY KEY (`idartigo`) ,
  INDEX `fk_artigo_usuario1` (`idusuario` ASC) ,
  CONSTRAINT `fk_artigo_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `mydb`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`comentario` (
  `idusuario` INT NOT NULL ,
  `idartigo` INT NOT NULL ,
  `corpo` VARCHAR(45) NULL ,
  `data` DATETIME NULL ,
  INDEX `fk_usuario_has_artigo_artigo1` (`idartigo` ASC) ,
  INDEX `fk_usuario_has_artigo_usuario` (`idusuario` ASC) ,
  CONSTRAINT `fk_usuario_has_artigo_usuario`
    FOREIGN KEY (`idusuario` )
    REFERENCES `mydb`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artigo_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `mydb`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`foto` (
  `idfoto` INT NOT NULL ,
  `arquivo` VARCHAR(45) NULL ,
  `idartigo` INT NOT NULL ,
  PRIMARY KEY (`idfoto`) ,
  INDEX `fk_foto_artigo1` (`idartigo` ASC) ,
  CONSTRAINT `fk_foto_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `mydb`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  `descricao` VARCHAR(100) NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria_has_artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`categoria_has_artigo` (
  `idcategoria` INT NOT NULL ,
  `idartigo` INT NOT NULL ,
  PRIMARY KEY (`idcategoria`, `idartigo`) ,
  INDEX `fk_categoria_has_artigo_artigo1` (`idartigo` ASC) ,
  INDEX `fk_categoria_has_artigo_categoria1` (`idcategoria` ASC) ,
  CONSTRAINT `fk_categoria_has_artigo_categoria1`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `mydb`.`categoria` (`idcategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_artigo_artigo1`
    FOREIGN KEY (`idartigo` )
    REFERENCES `mydb`.`artigo` (`idartigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
