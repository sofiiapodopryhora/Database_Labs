-- Таблиця для зберігання категорій новин
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

-- Таблиця для зберігання новин
CREATE TABLE articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    publish_date DATETIME NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Таблиця для зберігання коментарів
CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    comment_text TEXT NOT NULL,
    comment_date DATETIME NOT NULL,
    user_ip VARCHAR(45),
    FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

-- Таблиця для зберігання оцінок
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    rating_value INT CHECK (rating_value BETWEEN 1 AND 5),
    user_ip VARCHAR(45),
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    UNIQUE (article_id, user_ip)  
);
