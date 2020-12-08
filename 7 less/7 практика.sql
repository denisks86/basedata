
-- 1.	��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
   SELECT (name) ����������, COUNT(user_id) ����������_�������
     FROM users u
LEFT JOIN orders o ON u.id = o.user_id 
 GROUP BY name
   HAVING ����������_������� > 0


-- 2.	�������� ������ ������� products � �������� catalogs, ������� ������������� ������.
   SELECT (p.name) �����, (c.name) ������
     FROM products p 
LEFT JOIN catalogs c ON p.catalog_id = c.id  
