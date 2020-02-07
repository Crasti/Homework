-- Практическое задание по теме “Транзакции, переменные, представления”

-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION; 
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1 LIMIT 1;
COMMIT;
-- Если я правильно понял, и имеется ввиду переместить всю строку с id = 1 в такую же таблицу


-- Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW product AS
SELECT p.name, c.name AS category
FROM products p
JOIN catalogs c
ON p.catalog_id = c.id
WHERE p.id = 3;

SELECT * FROM product;


-- “Хранимые процедуры и функции, триггеры"

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости 
-- от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
DROP PROCEDURE IF EXISTS hello//
CREATE PROCEDURE hello()
  BEGIN
	  SET @times = (SELECT HOUR(NOW()));
	  IF (@times >= '6') AND (@times < '12') THEN
		SELECT 'Доброе утро' AS Приветствие;
	  ELSEIF (@times >= '12') AND (@times < '18') THEN
		SELECT 'Добрый день' AS Приветствие;
	  ELSEIF (@times >= '18') AND (@times < '24') THEN
		SELECT 'Добрый вечер' AS Приветствие;
	  ELSE (@times >= '0') AND (@times < '6') THEN
		SELECT 'Доброй ночи' AS Приветствие;
      END IF;
  END//

/* SHOW PROCEDURE STATUS;
CALL hello();
SELECT HOUR(NOW());
SELECT 'Доброе утро' AS Приветствие;
SELECT @times */


  
 /* В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
 значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля 
 были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию. /*
 
 
 
 
 
 
 
 


