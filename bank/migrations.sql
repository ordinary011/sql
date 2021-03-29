DROP SCHEMA bank;

CREATE SCHEMA IF NOT EXISTS `bank` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `bank` ;

-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`department` (
  `idDepartment` INT NOT NULL,
  `DepartmentCity` VARCHAR(45) NULL,
  `CountOfWorkers` INT NULL,
  PRIMARY KEY (`idDepartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`client` (
  `idClient` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Education` VARCHAR(45) NULL,
  `Passport` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Age` VARCHAR(45) NULL,
  `Department_idDepartment` INT NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Client_Department_idx` (`Department_idDepartment` ASC),
  CONSTRAINT `fk_Client_Department`
    FOREIGN KEY (`Department_idDepartment`)
    REFERENCES `bank`.`department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`application` (
  `idApplication` INT NOT NULL,
  `Sum` INT NULL,
  `CreditState` VARCHAR(45) NULL,
  `Currency` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idApplication`),
  INDEX `fk_Application_Client1_idx` (`Client_idClient` ASC),
  CONSTRAINT `fk_Application_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `bank`.`client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
