-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT CONCAT(
  'Пользователь ', 
  first_name,
  ' ', 
  last_name,
  ' ',
  'Больше всех общался с пользователем ',
  (SELECT first_name, last_name FROM profiles WHERE user_id IN (
       SELECT to_user_id AS user_id FROM (
        SELECT to_user_id, COUNT(from_user_id) AS counter 
        FROM messages WHERE is_delivered = '1' AND from_user_id = '13' AND to_user_id IN (
         
          (SELECT friend_id AS to_user_id
          FROM friendship 
          WHERE user_id = 13
          AND status_id IN (
            SELECT id FROM friendship_statuses 
            WHERE name = 'Confirmed'
          )
        )
        UNION
         (SELECT user_id 
         FROM friendship 
         WHERE friend_id = 13
         AND status_id IN (
           SELECT id FROM friendship_statuses 
           WHERE name = 'Confirmed'
         )
         )
       ) AS to_user_id
       GROUP BY to_user_id
       ORDER BY counter DESC
       LIMIT 1
       )
       
       )
      )
      FROM profiles WHERE user_id = '13'
      )  
 ;
-- тут совсем запутался как все объединить. кусками при некоторых перестановках работает
-- все вместе - нет



-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT COUNT(target_id) AS likes FROM likes WHERE target_id IN (
  SELECT user_id FROM profiles WHERE user_id IN (
    SELECT target_id FROM likes WHERE target_type_id = '2')
  ORDER BY UNIX_TIMESTAMP(STR_TO_DATE(birthdate, '%Y-%m-%d')) DESC
  LIMIT 10 
) 
;
-- внутренний запрос отдельно работает, внешний ругается на использование LIMIT во вложенном SELECT
-- как это обойти не обновляя MySQL?



-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- мужчины
SELECT COUNT(user_id) AS mens FROM likes WHERE id IN (
SELECT user_id FROM profiles WHERE sex = 'm'
);
-- женщины
SELECT COUNT(user_id) AS womans FROM likes WHERE id IN (
SELECT user_id FROM profiles WHERE sex = 'f'
); 





-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании 
-- социальной сети.


SELECT first_name, last_name FROM users WHERE id IN (
  SELECT user_id AS id FROM (
    SELECT user_id, COUNT(*) AS counter FROM likes
    GROUP BY user_id  
    ORDER BY counter
  ) AS id
)
LIMIT 10 
;










