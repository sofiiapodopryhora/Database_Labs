-- Таблиця для зберігання інформації про лінії метро
CREATE TABLE lines (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(100) NOT NULL, 
    color VARCHAR(30) DEFAULT NULL 
);

-- Таблиця для зберігання статусів (працює, будується)
CREATE TABLE statuses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(100) NOT NULL 
);

-- Таблиця для зберігання станцій та їх взаємозв'язків
CREATE TABLE stations (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    next_station_id INT UNIQUE DEFAULT NULL, 
    previous_station_id INT UNIQUE DEFAULT NULL,  
    line_id INT NOT NULL, 
    status_id INT NOT NULL, 
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (next_station_id) REFERENCES stations(id), -- Зв'язок із наступною станцією
    FOREIGN KEY (previous_station_id) REFERENCES stations(id), -- Зв'язок із попередньою станцією
    FOREIGN KEY (line_id) REFERENCES lines(id), -- Зв'язок із лінією
    FOREIGN KEY (status_id) REFERENCES statuses(id) -- Зв'язок із статусом
);

-- Таблиця для зберігання переходів між станціями
CREATE TABLE transition_on_station (
    first_station_id INT NOT NULL, -- ID першої станції у переході
    second_station_id INT NOT NULL, -- ID другої станції у переході
    PRIMARY KEY (first_station_id, second_station_id), 
    FOREIGN KEY (first_station_id) REFERENCES stations(id), -- Зв'язок із першою станцією
    FOREIGN KEY (second_station_id) REFERENCES stations(id) -- Зв'язок із другою станцією
);
