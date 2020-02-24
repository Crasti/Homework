-- Формирование профиля при создании нового пользователя

DELIMITER //
DROP TRIGGER IF EXISTS create_new_user//
CREATE TRIGGER create_new_user
  AFTER INSERT ON users
    FOR EACH ROW BEGIN
      INSERT INTO profiles(user_id, visits, user_privilegies_id) 
        SELECT NEW.id, 1, 1 FROM users;
DELIMITER ;


-- Покупки, визиты и конверсия визитов к покупкам

SELECT 
  u.first_name, 
  u.last_name, 
  COUNT(o.user_id) AS Total_purchases, 
  p.visits,
  COUNT(o.user_id) / p.visits AS Conversion
    FROM orders o
      LEFT JOIN profiles p
        ON p.user_id = o.user_id 
          LEFT JOIN users u
            ON u.id = p.user_id 
GROUP BY o.user_id
ORDER BY Conversion DESC;
        
    
-- Конверсия просмотров товара к покупкам

/*SELECT DISTINCT 
--  p.id AS idx,
--  p.name AS namex, 
  op.product_id,
--  a.previously_viewed_id,
  SUM(op.total) AS Total_purchases, 
  COUNT(a.previously_viewed_id) AS views,
  SUM(op.total) / COUNT(a.previously_viewed_id) AS Conversion
    FROM orders_products op
      LEFT JOIN activities a
        ON a.previously_viewed_id = op.product_id
         LEFT JOIN products p
            ON p.id = a.previously_viewed_id
GROUP BY op.product_id
ORDER BY a.previously_viewed_id DESC; */


-- Просмотр количества покупок пользователей

SELECT o.user_id,COUNT(o.user_id) AS Total
  FROM users u
    LEFT JOIN orders o
  ON u.id = o.user_id
GROUP BY o.user_id 
ORDER BY Total;


-- Конверсия просмотра товаров к покупкам

DROP FUNCTION IF EXISTS Conversion;

DELIMITER //
CREATE FUNCTION Conversion(check_product_id INT)
RETURNS FLOAT READS SQL DATA

  BEGIN
    
    DECLARE Purchases INT;
    DECLARE Views INT;
    
    SET Purchases = 
      (SELECT COUNT(product_id) FROM orders_products 
        WHERE product_id = check_product_id);
    
    SET Views = 
      (SELECT COUNT(previously_viewed_id) FROM activities
         WHERE previously_viewed_id = check_product_id);
    
    RETURN Purchases / Views;
  END//
  
DELIMITER ;
SELECT Conversion(6);

-- разбивка продуктов по категориям

CREATE OR REPLACE VIEW products_catalogs AS
SELECT
  p.name AS product,
  c.name AS `catalog`,
  ca.name AS categories
    FROM products AS p
      LEFT JOIN categories AS ca
        ON p.category_id = ca.id
      LEFT JOIN catalogs AS c
        ON  c.id = ca.catalog_id;

-- География пользователей по городам и доступным пунктам выдачи

CREATE OR REPLACE VIEW cities_points AS
SELECT 
  CONCAT(u.first_name, ' ', u.last_name) AS `user`,
  c.name AS `City`,
  poi.address AS Point_of_issue
    FROM users AS u
      LEFT JOIN cities AS c
        ON u.city_id = c.id
      LEFT JOIN point_of_issues AS poi
        ON poi.city_id = c.id;



