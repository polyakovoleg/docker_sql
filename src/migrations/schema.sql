-- MySQL Script generated by MySQL Workbench
-- Wed Apr 29 20:47:00 2020
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`auto_brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auto_brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`resellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resellers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adres` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`auto_models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auto_models` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `reseller_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  `price` INT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_avto_model_avto_brand1_idx` (`brand_id` ASC) VISIBLE,
  INDEX `fk_avto_model_reseller1_idx` (`reseller_id` ASC) VISIBLE,
  CONSTRAINT `fk_avto_model_avto_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`auto_brands` (`id`),
  CONSTRAINT `fk_avto_model_reseller1`
    FOREIGN KEY (`reseller_id`)
    REFERENCES `mydb`.`resellers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name` (`first_name` ASC, `second_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `sum` INT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_orders_clients1_idx` (`client_id` ASC) VISIBLE,
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`clients` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `sum` INT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_order_items_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_items_avto_models1_idx` (`model_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_avto_models1`
    FOREIGN KEY (`model_id`)
    REFERENCES `mydb`.`auto_models` (`id`),
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`orders` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`auto_brands`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`auto_brands` (`id`, `name`, `date_created`, `date_updated`) VALUES (1, 'BMW', '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_brands` (`id`, `name`, `date_created`, `date_updated`) VALUES (2, 'Audi', '2020-04-29 10:39:26', '2020-04-29 10:39:26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`resellers`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`resellers` (`id`, `name`, `adres`, `phone`, `date_created`, `date_updated`) VALUES (1, 'BMW-Favorit', 'Moscow, Kolchak`s st, 42', '+79105559966', '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`resellers` (`id`, `name`, `adres`, `phone`, `date_created`, `date_updated`) VALUES (2, 'Audi-Favorit', 'Moscow, Kolchak`s st, 43', '+79105559955', '2020-04-29 10:39:26', '2020-04-29 10:39:26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`auto_models`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (1, 'BMW X3', 1, 1, 2000000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (2, 'BMW X5', 1, 1, 3000000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (3, 'BMW X6', 1, 1, 2000000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (4, 'Audi Q3', 2, 2, 1750000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (5, 'Audi Q5', 2, 2, 2000000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`auto_models` (`id`, `name`, `reseller_id`, `brand_id`, `price`, `date_created`, `date_updated`) VALUES (6, 'Audi Q6', 2, 2, 2600000, '2020-04-29 10:39:26', '2020-04-29 10:39:26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`clients` (`id`, `first_name`, `second_name`, `phone`, `date_created`, `date_updated`) VALUES (1, 'Sergey', 'Ivanov', '+79107891122', '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`clients` (`id`, `first_name`, `second_name`, `phone`, `date_created`, `date_updated`) VALUES (2, 'Oleg', 'Korobkin', '+79107891155', '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`clients` (`id`, `first_name`, `second_name`, `phone`, `date_created`, `date_updated`) VALUES (3, 'Roman', 'Oleykin', '+79107891166 ', '2020-04-29 10:39:26', '2020-04-29 10:39:26');
INSERT INTO `mydb`.`clients` (`id`, `first_name`, `second_name`, `phone`, `date_created`, `date_updated`) VALUES (4, 'Dmitriy', 'Semenov', '+79107891177 ', '2020-04-29 10:39:26', '2020-04-29 10:39:26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (1, 1, 2000000, '2014-10-01 10:39:26', '2014-10-01 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (2, 2, 3500000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (3, 3, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (4, 2, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (5, 2, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (6, 3, 7800000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (7, 4, 10000000, '2014-10-03 10:39:26', '2014-10-03 10:39:26');
INSERT INTO `mydb`.`orders` (`id`, `client_id`, `sum`, `date_created`, `date_updated`) VALUES (8, 1, 3000000, '2014-10-03 10:39:26', '2014-10-03 10:39:26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`order_items`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (1, 1, 1, 1, 2000000, '2014-10-01 10:39:26', '2014-10-01 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (2, 2, 4, 2, 3500000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (3, 3, 3, 1, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (4, 4, 5, 1, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (5, 5, 1, 2, 2000000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (6, 6, 6, 3, 7800000, '2014-10-02 10:39:26', '2014-10-02 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (7, 7, 1, 4, 10000000, '2014-10-03 10:39:26', '2014-10-03 10:39:26');
INSERT INTO `mydb`.`order_items` (`id`, `order_id`, `model_id`, `quantity`, `sum`, `date_created`, `date_updated`) VALUES (8, 8, 2, 1, 3000000, '2014-10-03 10:39:26', '2014-10-03 10:39:26');

COMMIT;
