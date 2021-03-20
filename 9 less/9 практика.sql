

--1.	� ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������

SET AUTOCOMMIT=0;
INSERT INTO sample.users (name, birthday_at, created_at, updated_at)
SELECT su.name, su.birthday_at, su.created_at, su.updated_at FROM shop.users su WHERE su.id = 1;  
COMMIT;
SET AUTOCOMMIT=1;

-- 2.	�������� �������������, ������� ������� �������� name �������� ������� �� ������� products � ��������������� �������� �������� name �� ������� catalogs.
CREATE VIEW prod.������_������� AS
     SELECT (p.name) �����, (c.name) ������
       FROM prod.products p 
  LEFT JOIN prod.catalogs c ON p.catalog_id = c.id  


SELECT * FROM prod.������_�������


-- ��������� ��������� � �������, ��������"
-- 1.	�������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 
-- � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", 
-- � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
-- � 18:00 �� 00:00 � "������ �����", 
-- � 00:00 �� 6:00 � "������ ����".

    CREATE PROCEDURE ������()
    BEGIN
       DECLARE ����������� VARCHAR(50) DEFAULT '';
       DECLARE �������_����_������ VARCHAR(10); 
       DECLARE �������_���� DATETIME;
       DECLARE �����_���� DATETIME;
       DECLARE ����������_��� DATETIME;
       DECLARE �����_������ DATETIME;
       DECLARE ����������_���� DATETIME;
       SET ����������� = '';
       SET �������_���� = CURRENT_TIMESTAMP;
       SET �������_����_������ = CURRENT_DATE;
       SET �����_���� = STR_TO_DATE(CONCAT(�������_����_������, ' ', '06:00:00'), '%Y-%m-%d %H:%i:%s'); 
       SET ����������_��� = STR_TO_DATE(CONCAT(�������_����_������, ' ', '12:00:00'), '%Y-%m-%d %H:%i:%s'); 
       SET �����_������ = STR_TO_DATE(CONCAT(�������_����_������, ' ', '18:00:00'), '%Y-%m-%d %H:%i:%s'); 
       SET ����������_���� = STR_TO_DATE(CONCAT(�������_����_������, ' ', '00:00:00'), '%Y-%m-%d %H:%i:%s'); 
           
       IF (�������_���� > �����_���� AND �������_���� < ����������_���) THEN SET ����������� = '������ ����';
       ELSEIF (�������_���� > ����������_��� AND �������_���� < �����_������) THEN SET ����������� = '������ ����';
       ELSEIF (�������_���� > �����_������ AND �������_���� < ����������_����) THEN SET ����������� = '������ �����';
       ELSEIF (�������_���� > ����������_���� AND �������_���� < �����_����) THEN SET ����������� = '������ ����';
       END IF;
       
       SELECT �����������;      
    END;

   CALL ������ 



-- 2.	� ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
-- ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
-- ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
-- ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.


