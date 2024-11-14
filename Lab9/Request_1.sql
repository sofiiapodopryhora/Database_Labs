-- Таблиця для cтворення таблиці Users
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Таблиця для cтворення таблиці Projects
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    created_by INT REFERENCES Users(user_id)
);

-- Таблиця для Cтворення таблиці Tasks
CREATE TABLE Tasks (
    task_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES Projects(project_id),
    task_name VARCHAR(100) NOT NULL,
    author_id INT REFERENCES Users(user_id),
    assigned_to INT REFERENCES Users(user_id),
    description TEXT
);

-- Таблиця для cтворення зв'язуючої таблиці ProjectUsers для асоціації кількох користувачів із проєктами
CREATE TABLE ProjectUsers (
    project_id INT REFERENCES Projects(project_id),
    user_id INT REFERENCES Users(user_id),
    PRIMARY KEY (project_id, user_id)
);

-- Таблиця для cтворення таблиці Files
CREATE TABLE Files (
    file_id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    project_id INT REFERENCES Projects(project_id),
    task_id INT REFERENCES Tasks(task_id),
    file_link TEXT NOT NULL
);
