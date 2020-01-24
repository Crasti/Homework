-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

CREATE TABLE `test_table` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`user_id`,`friend_id`)
);

INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (15, 15, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (16, 16, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (17, 17, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (18, 18, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (19, 19, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (20, 20, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (21, 21, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (22, 22, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (23, 23, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (24, 24, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (25, 25, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (26, 26, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (27, 27, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (28, 28, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (29, 29, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (30, 30, 3);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (31, 31, 1);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (32, 32, 2);
INSERT INTO `test_table` (`user_id`, `friend_id`, `status_id`) VALUES (33, 33, 3);

ALTER TABLE `test_table` MODIFY COLUMN `created_at` TIMESTAMP NOT
NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `test_table` MODIFY COLUMN `updated_at` TIMESTAMP NOT
NULL DEFAULT CURRENT_TIMESTAMP;


-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля 
-- к типу DATETIME, сохранив введеные ранее значения.

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` varchar(100),
  `updated_at` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
);

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (1, 'Noelia', 'Larkin', 'turner.sally@example.com', '1-654-422-5011x', 'aaff3ce5bd70204', '"2015-12-08 04:59:14"', '"2003-11-07 13:14:43"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (2, 'Darrick', 'Greenfelder', 'swolff@example.org', '388-761-2349', 'b5018b492e87815', '"1970-01-21 17:11:13"', '"2013-12-14 14:23:55"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (3, 'Modesta', 'Heathcote', 'aschmidt@example.net', '(237)779-6832x6', 'e5e9dd65196b7d6', '"2017-08-28 18:25:24"', '"1993-07-15 00:31:52"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (4, 'Earnest', 'Blanda', 'fadel.malcolm@example.com', '(572)910-4067x2', '3e1e11ac9aa5107', '"2008-03-24 03:31:39"', '"1987-04-25 18:22:50"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (5, 'Vladimir', 'Koelpin', 'lkrajcik@example.org', '137.866.5081', 'bbf1f9eab839a86', '"2011-12-16 22:49:58"', '"1990-09-13 01:40:04"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (6, 'Sigurd', 'Schneider', 'klocko.liana@example.com', '510.380.9556x90', 'e006899f024f348', '"1995-06-14 18:51:10"', '"1996-10-03 11:44:53"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (7, 'Greta', 'Fritsch', 'ulang@example.net', '1-994-657-8853x', '45d8fa84c91bfc9', '"2006-02-22 03:33:20"', '"2016-09-07 11:35:28"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (8, 'Brody', 'Braun', 'magnolia.rempel@example.org', '(278)081-9411x6', 'a0a2cd820f93a18', '"2019-02-16 07:50:31"', '"1971-02-10 18:13:56"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (9, 'Delta', 'Gutmann', 'rasheed.becker@example.com', '+78(3)841047181', '4d877d90988d839', '"1979-10-04 15:53:45"', '"2015-09-18 12:01:06"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (10, 'Angeline', 'Braun', 'kattie.cummerata@example.net', '015.385.7726', 'c7b95d4ac3ed9b6', '"1986-10-13 03:38:58"', '"1976-04-03 08:53:24"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (11, 'Sheila', 'Rolfson', 'hledner@example.net', '1-956-551-2998x', 'e4b2cde255a4936', '"1988-10-08 02:08:03"', '"2004-04-02 20:10:53"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (12, 'Lola', 'Schinner', 'lisette55@example.com', '1-251-261-9184', 'bff41add4050bb3', '"1980-07-04 06:48:59"', '"1998-02-21 08:17:18"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (13, 'Alessia', 'Hettinger', 'armani.nikolaus@example.org', '401.988.9367x57', '226a5199befada1', '"1980-06-01 13:22:06"', '"2006-02-18 04:14:24"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (14, 'Alec', 'Daniel', 'vesta53@example.net', '+21(7)340226043', 'f7c9c2bf19853de', '"1972-09-01 09:43:11"', '"2018-08-12 01:30:14"');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES (15, 'Dominic', 'Yost', 'nienow.lukas@example.com', '(548)504-8938', 'e6d18c4c87eef63', '"1973-08-27 16:38:11"', '"1996-07-12 04:55:56"');

DESC users;

UPDATE `users` SET `created_at`=REPLACE(`created_at`, '\"', '');
UPDATE `users` SET `updated_at`=REPLACE(`updated_at`, '\"', '');
ALTER TABLE `users` MODIFY COLUMN `created_at` DATETIME NOT NULL;
ALTER TABLE `users` MODIFY COLUMN `updated_at` DATETIME NOT NULL;
-- UPDATE users SET `updated_at`=STR_TO_DATE(`updated_at`, '%Y-%m-%d %H:%i:%s'); 
-- ALTER TABLE `users` CHANGE `updated_at` `updated_at` DATETIME NOT NULL;

DESC users;


-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи 
-- таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны 
-- выводиться в конце, после всех записей.

CREATE TABLE `storehouses_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(10),
  PRIMARY KEY (`id`)
);

DESC storehouses_products;

INSERT INTO `storehouses_products` (`value`) VALUES (1);
INSERT INTO `storehouses_products` (`value`) VALUES (0);
INSERT INTO `storehouses_products` (`value`) VALUES (5);
INSERT INTO `storehouses_products` (`value`) VALUES (7);
INSERT INTO `storehouses_products` (`value`) VALUES (0);
INSERT INTO `storehouses_products` (`value`) VALUES (4);
INSERT INTO `storehouses_products` (`value`) VALUES (0);
INSERT INTO `storehouses_products` (`value`) VALUES (1);
INSERT INTO `storehouses_products` (`value`) VALUES (3);
INSERT INTO `storehouses_products` (`value`) VALUES (8);
INSERT INTO `storehouses_products` (`value`) VALUES (7);

SELECT * FROM storehouses_products ORDER BY CASE WHEN value=0 THEN 1 END, value;


-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT first_name, last_name, birthday FROM users WHERE birthday='may' OR 'august';


-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs 
-- WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs ORDER BY FIELD(id, 5,1,2);


-- Подсчитайте средний возраст пользователей в таблице users

SELECT
  AVG(
    (YEAR(CURRENT_DATE) - YEAR(birthdate)) -                            
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthdate, '%m%d'))
  )
FROM users
;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

/*SELECT
CASE `day_of_week`                            Хотел заменить в выводе числа на день недели. Но не успел доразобраться как..
	 WHEN day_of_week=2 WHEN 'понедельник'    Так же не успел корректно сделать задание, заменить год в днях рождения на текущий
	 WHEN day_of_week=3 WHEN 'вторник'        Времени не хватило (
	 WHEN day_of_week=4 WHEN 'среда'
	 WHEN day_of_week=5 WHEN 'четверг'
	 WHEN day_of_week=6 WHEN 'пятница'
	 WHEN day_of_week=7 WHEN 'суббота'
	 WHEN day_of_week=1 WHEN 'воскресенье'
FROM(*/
SELECT
DAYOFWEEK(`birthdate`) AS day_of_week,
COUNT(*)
FROM profiles
GROUP BY day_of_week;






