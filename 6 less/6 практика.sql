
-- 1. Создать и заполнить таблицы лайков и постов
 DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
 

DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

-- Проверим
SELECT * FROM likes LIMIT 10;


CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



-- 2. Создать все необходимые внешние ключи и диаграмму отношений.
ALTER TABLE profiles
  ADD CONSTRAINT profiles_countries_id_fk FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE SET NULL; 

ALTER TABLE media 
  ADD CONSTRAINT media_media_types_fk FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON DELETE RESTRICT; 

 ALTER TABLE users_media
  ADD CONSTRAINT users_media_users_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  ADD CONSTRAINT users_media_media_fk FOREIGN KEY (media_id) REFERENCES media(id) ON DELETE RESTRICT;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_statuses_id_fk FOREIGN KEY (status_id) REFERENCES user_statuses(id) ON DELETE SET NULL; 

 ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_users_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  ADD CONSTRAINT communities_users_communities_fk FOREIGN KEY (community_id) REFERENCES communities(id) ON DELETE CASCADE;

ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk FOREIGN KEY (friend_id) REFERENCES users(id) ON DELETE CASCADE;
 
 ALTER TABLE likes 
  ADD CONSTRAINT likes_users_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT;  

ALTER TABLE friendship
  ADD CONSTRAINT friendship_friendship_statuses_id_fk FOREIGN KEY (status_id) REFERENCES friendship_statuses(id) ON DELETE RESTRICT; 

ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  ADD CONSTRAINT posts_communities_id_fk FOREIGN KEY (community_id) REFERENCES communities(id) ON DELETE RESTRICT,
  ADD CONSTRAINT posts_media_id_fk FOREIGN KEY (media_id) REFERENCES media(id) ON DELETE RESTRICT;


-- 3 Определить кто больше поставил лайков (всего) - мужчины или женщины?
 SELECT IF(COUNT(gender_m) > COUNT(gender_f), COUNT(gender_m), COUNT(gender_f)) 
   FROM (
 SELECT  (SELECT p.gender FROM profiles p WHERE p.user_id = l.user_id AND p.gender = 'm') gender_m
        ,(SELECT p.gender FROM profiles p WHERE p.user_id = l.user_id AND p.gender = 'f') gender_f
   FROM likes l   
   ) tab


-- 4 Подсчитать количество лайков которые получили 10 самых молодых пользователей.
	SELECT user_id, age
	  FROM ( 
			  SELECT
				user_id
				, (YEAR(CURRENT_DATE) - YEAR((SELECT p.birthday FROM profiles p WHERE p.user_id = l.user_id))) 
				   - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT((SELECT p.birthday FROM profiles p WHERE p.user_id = l.user_id), '%m%d')) age
			   FROM likes l 
		   ) tab
	 WHERE age IS NOT NULL
  ORDER BY age
     LIMIT 10


-- 5 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети

-- 10 пользователей которые поставили меньше всего лайков
   SELECT user_id, COUNT(user_id) count_likes  
     FROM likes l
 GROUP BY user_id
 ORDER BY count_likes DESC
    LIMIT 10





