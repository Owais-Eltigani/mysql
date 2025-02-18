-- Active: 1697393044834@@127.0.0.1@3306
CREATE DATABASE `metro`;

USE `metro`;

CREATE TABLE
    `cards` (`id` INT, PRIMARY KEY (id));

CREATE TABLE
    `stations` (
        `id` int AUTO_INCREMENT,
        `name` VARCHAR(15) NOT NULL UNIQUE,
        line ENUM ('blue', 'red', 'green', 'orange'),
        PRIMARY KEY (`id`)
    );


    `swipes` (
        `id` INT AUTO_INCREMENT,
        `card_id` INT,
        `station_id` int,
        `type` ENUM ('enter', 'exit', 'deposit') NOT NULL,
        `datetime` DATETIME,
        `amount` DECIMAL(5, 2) NOT NULL CHECK (`amount` > 0),
        PRIMARY KEY (`id`),
        FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
        FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
    );

ALTER Table `swipes` MODIFY `type` ENUM ('enter', 'exit', 'deposit', 'sliver') NOT NULL;

SHOW TABLES;

DESCRIBE `swipes`;

DROP TABLE `stations`;