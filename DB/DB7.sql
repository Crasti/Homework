-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT name
  FROM users u
    JOIN orders o
    ON u.id = o.user_id
GROUP BY name;


-- Выведите список товаров products и разделов catalogs, который соответствует товару

SELECT c.name, p.name, p.description, p.price
  FROM catalogs c
    RIGHT JOIN products p
    ON c.id = p.catalog_id 
    WHERE catalog_id = '2'
ORDER BY p.price;


-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов 
-- flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
`id` INT(10) UNSIGNED NOT NULL,
`from` VARCHAR(255),
`to` VARCHAR(255)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
`lable` VARCHAR(255),
`name` VARCHAR(255)
);

INSERT INTO `flights` (`id`, `from`, `to`) 
  VALUES (1, 'moscow', 'omsk'),
         (2, 'novgorod', 'kazan'),
         (3, 'irkutsk', 'moscow'),
         (4, 'omsk', 'irkutsk'),
         (5, 'moscow', 'kazan');
        
SET character_set_client='UTF8';
SET character_set_results='UTF8'; 
SET character_set_database='UTF8'; 
SET character_set_system='UTF8'; 

        
INSERT INTO `cities` (`lable`, `name`) 
  VALUES ('moscow', 'москва'),
         ('novgorod', 'новгород'),
         ('irkutsk', 'иркутск'),
         ('omsk', 'омск'),
         ('kazan', 'казань');
        
        
SELECT
 f.id,
 `from`.name AS `from`,
 `to`.name AS `to`
   FROM flights AS f
     LEFT JOIN cities AS `from`
     ON f.from = `from`.lable
       LEFT JOIN cities AS `to`
       ON f.to = `to`.lable
ORDER BY f.id;
  



         
         