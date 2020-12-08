
-- 1.	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
   SELECT (name) покупатель, COUNT(user_id) количество_покупок
     FROM users u
LEFT JOIN orders o ON u.id = o.user_id 
 GROUP BY name
   HAVING количество_покупок > 0


-- 2.	Выведите список товаров products и разделов catalogs, который соответствует товару.
   SELECT (p.name) товар, (c.name) раздел
     FROM products p 
LEFT JOIN catalogs c ON p.catalog_id = c.id  
