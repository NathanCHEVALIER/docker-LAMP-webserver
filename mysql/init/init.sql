/*  Create user and set permission */ 
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON example . * TO 'user'@'%';
FLUSH PRIVILEGES;

/*  Create database */ 
CREATE DATABASE IF NOT EXISTS example;

/*  Create table */ 
CREATE TABLE IF NOT EXISTS `example`.`test` (
    `id` INT NOT NULL AUTO_INCREMENT ,
    `content` VARCHAR(255) NOT NULL ,
    PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;

/* Insert data */ 
INSERT INTO `example`.`test` (content) VALUES ("Hello from MySQL");
