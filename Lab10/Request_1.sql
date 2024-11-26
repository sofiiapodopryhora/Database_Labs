CREATE DATABASE metro_map;
USE metro_map;

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- Таблиця для збереження станцій
DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `station_id` INT AUTO_INCREMENT PRIMARY KEY,
  `station_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  UNIQUE KEY `station_name_city` (`station_name`, `city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Додавання станцій
INSERT INTO `stations` (`station_id`, `station_name`, `city`) VALUES
(1, 'Freedom Square', 'Kharkiv'),
(2, 'Constitution Square', 'Kharkiv'),
(3, 'Heroiv Square', 'Kharkiv'),
(4, 'Science Avenue', 'Kharkiv'),
(5, 'Architect Beketov', 'Kharkiv');

-- Таблиця для ліній метро
DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `line_id` INT AUTO_INCREMENT PRIMARY KEY,
  `line_name` VARCHAR(100) NOT NULL,
  `color` VARCHAR(7) NOT NULL DEFAULT '#000000',
  UNIQUE KEY `line_name` (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Додавання ліній метро
INSERT INTO `lines` (`line_id`, `line_name`, `color`) VALUES
(1, 'Red Line', '#FF5733'),
(2, 'Blue Line', '#337BFF'),
(3, 'Green Line', '#33FF57');

-- Таблиця для зв’язків станцій з лініями, додано попередню та наступну станцію
DROP TABLE IF EXISTS `line_stations`;
CREATE TABLE `line_stations` (
  `line_station_id` INT AUTO_INCREMENT PRIMARY KEY,
  `line_id` INT NOT NULL,
  `station_id` INT NOT NULL,
  `order_on_line` INT NOT NULL,
  `previous_station` INT DEFAULT NULL,
  `next_station` INT DEFAULT NULL,
  FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON DELETE CASCADE,
  FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE,
  FOREIGN KEY (`previous_station`) REFERENCES `stations` (`station_id`) ON DELETE SET NULL,
  FOREIGN KEY (`next_station`) REFERENCES `stations` (`station_id`) ON DELETE SET NULL,
  UNIQUE KEY `line_station_order` (`line_id`, `order_on_line`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Додавання станцій до ліній метро із зазначенням попередньої та наступної станції
INSERT INTO `line_stations` (`line_station_id`, `line_id`, `station_id`, `order_on_line`, `previous_station`, `next_station`) VALUES
(1, 1, 1, 1, NULL, 2),  -- Перша станція, без попередньої
(2, 1, 2, 2, 1, 3),     -- Друга станція, зв'язана з першою та третьою
(3, 1, 3, 3, 2, NULL),  -- Третя станція, без наступної
(4, 2, 4, 1, NULL, 5),  -- Перша станція на другій лінії
(5, 2, 5, 2, 4, NULL);  -- Друга станція на другій лінії

-- Таблиця для зв’язків між станціями
DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `connection_id` INT AUTO_INCREMENT PRIMARY KEY,
  `station_id_from` INT NOT NULL,
  `station_id_to` INT NOT NULL,
  `connection_type` VARCHAR(50) DEFAULT 'standard',
  FOREIGN KEY (`station_id_from`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE,
  FOREIGN KEY (`station_id_to`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE,
  UNIQUE KEY `station_connection` (`station_id_from`, `station_id_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Додавання зв’язків між станціями
INSERT INTO `connections` (`connection_id`, `station_id_from`, `station_id_to`, `connection_type`) VALUES
(1, 1, 2, 'standard'),
(2, 2, 3, 'standard'),
(3, 4, 5, 'standard');
