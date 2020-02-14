/* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах 
users, catalogs и products в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа и содержимое поля name.  */


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  created_at DATETIME,
  table_name VARCHAR(255) COMMENT 'Имя таблицы',
  key_id SERIAL COMMENT 'Идентификатор ключа',
  name VARCHAR(255) COMMENT 'Название'
) COMMENT = 'Логгирование' ENGINE=Archive;


DELIMITER //
DROP TRIGGER IF EXISTS logging_insert_products//
CREATE TRIGGER logging_insert_products
  AFTER INSERT ON Shop.products 
    FOR EACH ROW BEGIN
      INSERT INTO Shop.logs(created_at, table_name, key_id, name) 
        VALUES(NOW(),"products", NEW.id, NEW.name);
end//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS logging_insert_users//
CREATE TRIGGER logging_insert_users
  AFTER INSERT ON Shop.users
    FOR EACH ROW BEGIN
      INSERT INTO Shop.logs(created_at, table_name, key_id, name) 
        VALUES(NOW(),"users", NEW.id, NEW.name);
end//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS logging_insert_catalogs//
CREATE TRIGGER logging_insert_catalogs
  AFTER INSERT ON Shop.catalogs
    FOR EACH ROW BEGIN
      INSERT INTO Shop.logs(created_at, table_name, key_id, name) 
        VALUES(NOW(),"catalogs", NEW.id, NEW.name);
end//
DELIMITER ;


-- (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DELIMITER //
CREATE PROCEDURE one_million()
BEGIN
  DECLARE v INT DEFAULT 0;
  WHILE v < 200000 DO
    INSERT users(id) VALUES (v+1),(v+2),(v+3),(v+4), (v+5), (v+6),(v+7),(v+8),(v+9), (v+10);
    SET v = v + 10;
  END WHILE;
END//
DELIMITER ;


-- В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.


MSET ip:127.0.0.1 1 ip:1 192.168.0.1 1 ip:192.168.1.1 1
INCR ip:127.0.0.1
MGET ip:127.0.0.1 ip:192.168.0.1



/* При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, 
 поиск электронного адреса пользователя по его имени. */


HMSET user name "Ivanov" email "ivanov@mail.ru"
HVALS user name "Ivanov"
HVALS user email "ivanov@mail.ru"

-- Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.

db.shop.catalogs.insert({id: '1', name: 'Процессоры'})
db.shop.products.insert({id: '1', name: 'Intel Core i3-8100', description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', price: '7890.00', catalog_id: '1', created_at: '2020-02-13 23:34:42', updated_at: '2020-02-13 23:34:42'})

-- не очень разобрался в этом задании, было маловато информации


