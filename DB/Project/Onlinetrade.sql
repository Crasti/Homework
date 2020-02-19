DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) COMMENT 'Имя',
  last_name VARCHAR(255) COMMENT 'Фамилия',
  phone_number VARCHAR(255) COMMENT 'Телефон',
  birthday_at DATE COMMENT 'Дата рождения',
  sex VARCHAR(10) COMMENT 'Пол',
  email VARCHAR(255) NOT NULL UNIQUE COMMENT 'Электронная почта',
  city_id INT UNSIGNED NOT NULL COMMENT 'Город проживания',
  archived BOOL DEFAULT 0 COMMENT 'Удален ли пользователь',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  user_privilegies_id INT UNSIGNED NOT NULL COMMENT 'Статус привелегий клиента',
  point_of_issue_id INT UNSIGNED COMMENT 'Пункт выдачи',
  bonus_count INT UNSIGNED DEFAULT 0 COMMENT 'Баланс бонусов',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';


DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Город'
) COMMENT = 'Список городов';


DROP TABLE IF EXISTS point_of_issues;
CREATE TABLE point_of_issues (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  city_id INT UNSIGNED NOT NULL COMMENT 'Город',
  address VARCHAR(255) NOT NULL COMMENT 'Адрес пункта выдачи'
) COMMENT = 'Список пунктов выдачи';

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';


DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  catalog_id INT UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Категории товара'
) COMMENT = 'Категории разделов интернет-магазина';


DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_id INT UNSIGNED NOT NULL,
  photo_id INT UNSIGNED,
  name VARCHAR(255) NOT NULL COMMENT 'Название',
  description TEXT NOT NULL COMMENT 'Описание',
  price DECIMAL (11,2) NOT NULL COMMENT 'Цена',
  quantity INT UNSIGNED COMMENT 'Количество',
  availiability BOOL NOT NULL COMMENT 'Наличие',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Товарные позиции';


DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  url VARCHAR(255) COMMENT 'Ссылка на фотографии'
) COMMENT = 'Фотографии';


DROP TABLE IF EXISTS carts;
CREATE TABLE carts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  counts INT UNSIGNED NOT NULL COMMENT 'Кол-во товара',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Корзина';


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Заказы';


DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Скидки';


DROP TABLE IF EXISTS actions;
CREATE TABLE actions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL COMMENT 'Название акции',
  description TEXT NOT NULL COMMENT 'Описание',
  product_id INT UNSIGNED NOT NULL,
  archived BOOL NOT NULL COMMENT 'Активна ли акция',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Акции';


DROP TABLE IF EXISTS user_privilegies;
CREATE TABLE user_privilegies (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL COMMENT 'Название привилегии',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Список привилегий';


DROP TABLE IF EXISTS activities;
CREATE TABLE activities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  visits INT UNSIGNED NOT NULL COMMENT 'Количество визитов',
  previously_viewed_id INT UNSIGNED COMMENT 'Просмотрено ранее',
  purchased_earler_id INT UNSIGNED COMMENT 'Куплено ранее',
  bookmarked_goods_id INT UNSIGNED COMMENT 'Товар в закладках',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Список активностей';


ALTER TABLE users
  ADD CONSTRAINT users_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES cities(id);


ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT profiles_user_privilegies_id_fk
    FOREIGN KEY (user_privilegies_id) REFERENCES user_privilegies(id),
  ADD CONSTRAINT profiles_point_of_issue_id_fk
    FOREIGN KEY (point_of_issue_id) REFERENCES point_of_issues(id);


 ALTER TABLE point_of_issues
  ADD CONSTRAINT point_of_issues_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES cities(id);
  
    
ALTER TABLE categories
 ADD CONSTRAINT category_catalog_id_fk 
   FOREIGN KEY (catalog_id) REFERENCES catalogs(id); 
    
     
ALTER TABLE products
  ADD CONSTRAINT products_category_id_fk 
    FOREIGN KEY (category_id) REFERENCES categories(id),
ADD CONSTRAINT products_photo_id_fk 
   FOREIGN KEY (photo_id) REFERENCES photos(id);
    
    
ALTER TABLE carts
  ADD CONSTRAINT carts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT carts_product_id_fk 
  FOREIGN KEY (product_id) REFERENCES products(id);

    
ALTER TABLE orders  
  ADD CONSTRAINT orders_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
    
    
ALTER TABLE orders_products  
  ADD CONSTRAINT orders_products_order_id_fk 
    FOREIGN KEY (order_id) REFERENCES orders(id),
  ADD CONSTRAINT orders_products_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id);

    
ALTER TABLE discounts  
  ADD CONSTRAINT discounts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT discounts_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id);
    
    
ALTER TABLE actions  
  ADD CONSTRAINT actions_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id);   
    
    
ALTER TABLE activities
  ADD CONSTRAINT activities_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT activities_previously_viewed_id_fk
    FOREIGN KEY (previously_viewed_id) REFERENCES products(id),
  ADD CONSTRAINT activities_purchased_earler_id_fk 
    FOREIGN KEY (purchased_earler_id) REFERENCES products(id),
  ADD CONSTRAINT activities_bookmarked_goods_id_fk
    FOREIGN KEY (bookmarked_goods_id) REFERENCES products(id);   
    
    
CREATE INDEX users_last_name_first_name_idx ON users(last_name, first_name);
CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE INDEX products_name_idx ON products(name);
CREATE INDEX products_price_idx ON products(price);
CREATE INDEX cities_name_idx ON cities(name);
CREATE INDEX products_name_idx ON products(name);
CREATE INDEX categories_name_idx ON categories(name);    
    
    
    
    
    
    
    
      
