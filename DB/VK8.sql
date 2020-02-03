-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT
CONCAT(u.first_name, ' ', u.last_name) AS name,
m.from_user_id, m.to_user_id,
COUNT(m.to_user_id) AS total_messages
  FROM messages m
    JOIN users u
    ON m.from_user_id = u.id
--    WHERE u.id = 23
    JOIN friendship f
    ON u.id = f.friend_id
    OR u.id = f.user_id
    WHERE f.status_id = 2 AND m.to_user_id = 13
GROUP BY m.to_user_id
ORDER BY total_messages DESC LIMIT 1;


-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

DESC likes;
SELECT SUM(total_likes) AS likes_total FROM (
SELECT COUNT(*) AS total_likes
  FROM profiles p
  RIGHT JOIN likes l
  ON p.user_id = l.target_id
  WHERE l.target_type_id = 2
  GROUP BY l.target_id
  ORDER BY p.birthdate DESC LIMIT 10 
) AS anithing;


-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
-- мужчины

SELECT CASE(p.sex)
		WHEN 'm' THEN 'man'
		WHEN 'f' THEN 'woman'
	END AS sex, 
	COUNT(l.user_id) AS total_likes
  FROM likes l
  LEFT JOIN profiles p
  ON l.user_id = p.user_id 
  GROUP BY p.sex
  ORDER BY total_likes DESC
  LIMIT 1;

 
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании 
-- социальной сети.

SELECT u.first_name, u.last_name, COUNT(l.user_id) AS total_likes
  FROM users u
  LEFT JOIN likes l
  ON u.id = l.user_id
  GROUP BY l.user_id
  ORDER BY total_likes
 LIMIT 10;








