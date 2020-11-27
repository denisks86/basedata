
-- выполнение команд 

CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название страны",
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник стран";  

CREATE TABLE user_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник статусов пользователей";  

UPDATE vk.profiles 
   SET country = NULL 

UPDATE vk.profiles 
   SET status = NULL 

-- изменение типа данных и имен столбцов через dbeaver 

 INSERT INTO user_statuses (name) VALUES ('статус1'),('статус2');



 CREATE TABLE users_media (
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиа-файл",
  is_photo BOOLEAN NOT NULL DEFAULT false COMMENT Данный файл является фотографией пользователя	
  PRIMARY KEY (user_id, media_id) COMMENT "Составной первичный ключ"
) COMMENT "Принадлежность файла пользователю"


UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;

UPDATE profiles SET photo_id = 1+FLOOR(1+RAND()*100) 

CREATE TEMPORARY TABLE  genders (name CHAR(1));
INSERT INTO genders VALUES ('m'),('f');

UPDATE profiles SET gender  = ( SELECT name FROM genders ORDER BY RAND() LIMIT 1 );

UPDATE profiles SET status_id = 1+FLOOR(1+RAND()*2) 

UPDATE messages SET from_user_id = 1+FLOOR(1+RAND()*100), to_user_id = 1+FLOOR(1+RAND()*100) 

 DELETE FROM media_types;               
 TRUNCATE media_types;               
 INSERT INTO media_types (name) VALUES ('audio'),
  ('video'),('image');

 UPDATE media SET media_type_id = 1+FLOOR(1+RAND()*3);



 CREATE TEMPORARY TABLE extentions (name CHAR(20));
 INSERT INTO media_types (name) VALUES ('jpg'),
  ('avi'),('png');

UPDATE media SET filename = CONCAT('https://dropbox.net/vk/', filename, '.', 'jpg'); 


CREATE TEMPORARY TABLE extentions (name CHAR(20));
 INSERT INTO extentions (name) VALUES ('jpg'),
  ('avi'),('png');

UPDATE media SET filename = CONCAT('https://dropbox.net/vk/', filename, '.', (SELECT name FROM extentions ORDER BY RAND() LIMIT 1 )); 

 UPDATE media SET `size` = 100000+FLOOR(RAND()*10000000) WHERE size < 10000;

 UPDATE media SET metadata = CONCAT(
'{"owner":"',
(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
'"}'
); 


ALTER media MODIFY COLUMN metadata JSON;

 TRUNCATE friendship_statuses; 

INSERT INTO friendship_statuses (name) VALUES ('rej'),('con'),('rec');

UPDATE friendship SET user_id = 1+FLOOR(1+RAND()*100), 
                 friend_id = 1+FLOOR(1+RAND()*100),                
                 status_id = 1+FLOOR(1+RAND()*3)

DELETE FROM communities WHERE id > 20


UPDATE communities_users SET user_id = 1+FLOOR(1+RAND()*20),
                 user_id = 1+FLOOR(1+RAND()*100)

