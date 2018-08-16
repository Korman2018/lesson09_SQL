-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Authors` (
  `idAuthor` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `patronymic` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAuthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `patronymic` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genres` (
  `idGenre` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT 'Unknown',
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Librarians`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Librarians` (
  `idLibrarian` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NULL,
  PRIMARY KEY (`idLibrarian`),
  INDEX `fk_Librarians_Users1_idx` (`idUser` ASC),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC),
  CONSTRAINT `fk_Librarians_Users1`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Books` (
  `idBook` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `idAuthor` INT NULL,
  `idGenre` INT NULL,
  `idLibrarian` INT NULL,
  PRIMARY KEY (`idBook`),
  INDEX `fk_Books_Authors1_idx` (`idAuthor` ASC),
  INDEX `fk_Books_Genres1_idx` (`idGenre` ASC),
  INDEX `fk_Books_Librarians1_idx` (`idLibrarian` ASC),
  CONSTRAINT `fk_Books_Authors1`
    FOREIGN KEY (`idAuthor`)
    REFERENCES `mydb`.`Authors` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Books_Genres1`
    FOREIGN KEY (`idGenre`)
    REFERENCES `mydb`.`Genres` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Books_Librarians1`
    FOREIGN KEY (`idLibrarian`)
    REFERENCES `mydb`.`Librarians` (`idLibrarian`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Statuses` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Readers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Readers` (
  `idReader` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NULL,
  PRIMARY KEY (`idReader`),
  INDEX `fk_Readers_Users1_idx` (`idUser` ASC),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC),
  CONSTRAINT `fk_Readers_Users1`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BookRequests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookRequests` (
  `idBookRequest` INT NOT NULL AUTO_INCREMENT,
  `idReader` INT NOT NULL,
  `idBook` INT NOT NULL,
  `dateoOfIssue` DATETIME NULL DEFAULT '1990-01-01',
  `dateOfReturn` DATETIME NULL DEFAULT '1990-01-01',
  `idStatus` INT NOT NULL DEFAULT 1,
  `idLibrarian` INT NULL,
  PRIMARY KEY (`idBookRequest`),
  INDEX `fk_BookRequest_Books1_idx` (`idBook` ASC),
  INDEX `fk_BookRequests_Statuses1_idx` (`idStatus` ASC),
  INDEX `fk_BookRequests_Readers1_idx` (`idReader` ASC),
  INDEX `fk_BookRequests_Librarians1_idx` (`idLibrarian` ASC),
  CONSTRAINT `fk_BookRequest_Books1`
    FOREIGN KEY (`idBook`)
    REFERENCES `mydb`.`Books` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookRequests_Statuses1`
    FOREIGN KEY (`idStatus`)
    REFERENCES `mydb`.`Statuses` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookRequests_Readers1`
    FOREIGN KEY (`idReader`)
    REFERENCES `mydb`.`Readers` (`idReader`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookRequests_Librarians1`
    FOREIGN KEY (`idLibrarian`)
    REFERENCES `mydb`.`Librarians` (`idLibrarian`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view1` AS
select * from users;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Authors`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Александр', 'Сергеевич', 'Пушкин');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Лев', 'Николаевич', 'Толстой');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Федор', 'Михайлович', 'Достоевский');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Михаил', 'Афанасьевич', 'Булгаков');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Николай', 'Васильевич', 'Гоголь');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Жюль', NULL, 'Верн');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Артур', NULL, 'Конан Дойл');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Марк', NULL, 'Твен');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Джон', NULL, 'Толкин');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Гебрерт', NULL, 'Шилдт');
INSERT INTO `mydb`.`Authors` (`idAuthor`, `name`, `patronymic`, `surname`) VALUES (DEFAULT, 'Агата', NULL, 'Кристи');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Иван', 'Иванович', 'Иванов', 'ivanov', 'ivan');
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Петр', 'Петрович', 'Петров', 'petrov', 'petr');
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Сидор', 'Сидорович', 'Сидоров', 'sidorov', 'sidor');
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Вася', '', 'Пупкин', 'pupkin', 'vasya');
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Андрей', 'Андреевич', 'Андреев', 'andreev', 'andrey');
INSERT INTO `mydb`.`Users` (`idUser`, `name`, `patronymic`, `surname`, `login`, `password`) VALUES (DEFAULT, 'Михаил', 'Михайлович', 'Михайлов', 'mikhailov', 'mikhail');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Genres`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Фантастика');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Классика');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Детектив');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Фэнтези');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Исторический роман');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Ужасы');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Научная литература');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Справочник');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Сказки');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Обучение');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Ужасы');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Техническая литература');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Энциклопедия');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Юмор');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Детская литература');
INSERT INTO `mydb`.`Genres` (`idGenre`, `name`) VALUES (DEFAULT, 'Поэзия');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Librarians`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Librarians` (`idLibrarian`, `idUser`) VALUES (DEFAULT, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Books`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Хоббит', 9, 4, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Евгений Онегин', 1, 2, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Java 8', 10, 12, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Война и Мир', 2, 5, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Таинственный остров', 6, 1, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, '20 тысяч лье под водой', 6, 1, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, '10 негритят', 11, 3, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Вий', 5, 2, 1);
INSERT INTO `mydb`.`Books` (`idBook`, `title`, `idAuthor`, `idGenre`, `idLibrarian`) VALUES (DEFAULT, 'Хоббит', 9, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Statuses`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Statuses` (`idStatus`, `name`) VALUES (DEFAULT, 'запрос');
INSERT INTO `mydb`.`Statuses` (`idStatus`, `name`) VALUES (DEFAULT, 'выдача');
INSERT INTO `mydb`.`Statuses` (`idStatus`, `name`) VALUES (DEFAULT, 'возврат');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Readers`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Readers` (`idReader`, `idUser`) VALUES (DEFAULT, 1);
INSERT INTO `mydb`.`Readers` (`idReader`, `idUser`) VALUES (DEFAULT, 2);
INSERT INTO `mydb`.`Readers` (`idReader`, `idUser`) VALUES (DEFAULT, 3);
INSERT INTO `mydb`.`Readers` (`idReader`, `idUser`) VALUES (DEFAULT, 5);
INSERT INTO `mydb`.`Readers` (`idReader`, `idUser`) VALUES (DEFAULT, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`BookRequests`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`BookRequests` (`idBookRequest`, `idReader`, `idBook`, `dateoOfIssue`, `dateOfReturn`, `idStatus`, `idLibrarian`) VALUES (DEFAULT, 1, 1, '2018.08.15', NULL, 2, 1);
INSERT INTO `mydb`.`BookRequests` (`idBookRequest`, `idReader`, `idBook`, `dateoOfIssue`, `dateOfReturn`, `idStatus`, `idLibrarian`) VALUES (DEFAULT, 1, 2, '2018.08.15', NULL, 1, NULL);
INSERT INTO `mydb`.`BookRequests` (`idBookRequest`, `idReader`, `idBook`, `dateoOfIssue`, `dateOfReturn`, `idStatus`, `idLibrarian`) VALUES (DEFAULT, 2, 4, '2018.08.15', NULL, 1, NULL);
INSERT INTO `mydb`.`BookRequests` (`idBookRequest`, `idReader`, `idBook`, `dateoOfIssue`, `dateOfReturn`, `idStatus`, `idLibrarian`) VALUES (DEFAULT, 4, 1, '2018.08.10', '2018.08.14', 3, 1);

COMMIT;

