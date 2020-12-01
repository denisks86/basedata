

-- 1-е задание
UPDATE users 
   SET created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP
 WHERE created_at IS NULL
   AND updated_at IS NULL 



-- 2-е задание
SELECT STR_TO_DATE(created_at, '%e.%c.%Y %l:%i') created_at
      ,STR_TO_DATE(updated_at, '%e.%c.%Y %l:%i') updated_at
  FROM users


-- 3-е задание
CREATE TEMPORARY TABLE tmp_table (
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	value int unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1

INSERT INTO tmp_table SET value = 0;
INSERT INTO tmp_table SET value = 2500;
INSERT INTO tmp_table SET value = 0;
INSERT INTO tmp_table SET value = 30;
INSERT INTO tmp_table SET value = 500;
INSERT INTO tmp_table SET value = 1;

SELECT * FROM tmp_table
ORDER BY IF(value > 0,  1,  0) DESC, value ASC   


-- 4-е задание
SELECT
  AVG(
    (YEAR(CURRENT_DATE) - YEAR(birth_date)) -                             
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birth_date, '%m%d'))  
  )  AS age
FROM tmp_table


-- 5-е задание
 SELECT 
   birth_date 
 , DAYOFWEEK(birth_date)   
 , DAYOFWEEK(CONCAT(DATE_FORMAT(CURRENT_DATE, '%Y-'),DATE_FORMAT(birth_date, '%m-%d')))  
 FROM tmp_table
