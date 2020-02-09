/* 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения 
и добавить необходимые индексы. */

CREATE INDEX profiles_hometown_idx ON profiles(hometown);
CREATE INDEX profiles_country_idx ON profiles(country);
CREATE INDEX users_last_name_first_name_idx ON users(last_name, first_name);
CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE INDEX communities_name_idx ON communities(name);

/* 2. Задание на оконные функции
Построить запрос, который будет выводить следующие столбцы:
имя группы
среднее количество пользователей в группах
самый молодой пользователь в группе
самый пожилой пользователь в группе
общее количество пользователей в группе
всего пользователей в системе
отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100  */

SELECT
  AVG(COUNT(cu.user_id)) OVER() AS average_in_groups,
  MAX(p.birthdate) OVER w AS min_age,
  MIN(p.birthdate) OVER w AS max_age,
  COUNT(cu.user_id) OVER w AS total_in_group,
  COUNT(p.user_id) OVER() AS total_in_system,
  COUNT(cu.user_id) OVER w / COUNT(p.user_id) OVER() * 100 AS "%%"
    FROM (communities c 
      JOIN communities_users cu
        ON c.id = cu.community_id
        AND community_id = 7
          JOIN profiles p
            ON p.user_id = cu.user_id)
        WINDOW w AS (PARTITION BY cu.user_id); -- У меня MYSQL 5.7 оконные не работают, не смог тестировать результат


/* 3. (по желанию) Задание на денормализацию
Разобраться как построен и работает следующий запрос:
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT users.id,
  COUNT(DISTINCT messages.id) + 
  COUNT(DISTINCT likes.id) + 
  COUNT(DISTINCT media.id) AS activity 
  FROM users
    LEFT JOIN messages 
      ON users.id = messages.from_user_id
    LEFT JOIN likes
      ON users.id = likes.user_id
    LEFT JOIN media
      ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity
  LIMIT 10;
	
Правильно-ли он построен?
Какие изменения, включая денормализацию, можно внести в структуру БД
чтобы существенно повысить скорость работы этого запроса? */
 
 