DESC profiles;
DESC users;

-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;
     
ALTER TABLE profiles
  ADD CONSTRAINT family_status_id_fk 
    FOREIGN KEY (family_status_id) REFERENCES family_statuses(id)
      ON DELETE CASCADE;

-- Изменяем тип столбца при необходимости
-- ALTER TABLE profiles DROP FOREIGN KEY profles_user_id_fk;
-- ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;

DESC messages;

-- Добавляем внешние ключи
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
   
   
DESC posts;
DESC users;
DESC media;

-- Добавляем внешние ключи
ALTER TABLE posts
  ADD CONSTRAINT posts_autor_id_fk 
    FOREIGN KEY (autor_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON DELETE SET NULL;
     
     
DESC media;
DESC media_types;

-- Добавляем внешние ключи
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media(id)
      ON DELETE SET NULL;
     
     
DESC likes;

-- Добавляем внешние ключи
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id)
      ON DELETE NO ACTION;
     
     
DESC friendship;

-- Добавляем внешние ключи
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT friendship_target_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
      ON DELETE SET NULL;
     
     
DESC communities_users;

-- Добавляем внешние ключи
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
      ON DELETE CASCADE;



-- Если нужно удалить
-- ALTER TABLE table_name DROP FOREIGN KEY constraint_name;
