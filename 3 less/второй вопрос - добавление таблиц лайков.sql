


-- ������ ��
CREATE DATABASE vk;

-- ������ � �������
USE vk;

-- ������ ������� �������������
CREATE TABLE users (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  first_name VARCHAR(100) NOT NULL COMMENT "��� ������������",
  last_name VARCHAR(100) NOT NULL COMMENT "������� ������������",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "�����",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "�������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������������";  

-- ������� ��������
CREATE TABLE profiles (
  ������������_�� INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "������ �� ������������", 
  ���_������������_�� int NOT NULL COMMENT "������ �� ��� ������������",
  birthday DATE COMMENT "���� ��������",
  photo_id INT UNSIGNED COMMENT "������ �� �������� ���������� ������������",
  status VARCHAR(30) COMMENT "������� ������",
  �����_�� INT COMMENT "������ �� ����� ����������",
  ������_�� INT COMMENT "������ �� ������ ����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "�������"; 

--


-- ������� ���������
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  from_user_�� INT UNSIGNED NOT NULL COMMENT "������ �� ����������� ���������",
  to_user_�� INT UNSIGNED NOT NULL COMMENT "������ �� ���������� ���������",
  body TEXT NOT NULL COMMENT "����� ���������",
  is_important BOOLEAN COMMENT "������� ��������",
  is_delivered BOOLEAN COMMENT "������� ��������",
  created_at DATETIME DEFAULT NOW() COMMENT "����� �������� ������",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "���������";

-- ������� ������
CREATE TABLE friendship (
  user_�� INT UNSIGNED NOT NULL COMMENT "������ �� ���������� ��������� ���������",
  friend_id INT UNSIGNED NOT NULL COMMENT "������ �� ���������� ����������� �������",
  status_id INT UNSIGNED NOT NULL COMMENT "������ �� ������ (������� ���������) ���������",
  requested_at DATETIME DEFAULT NOW() COMMENT "����� ����������� ����������� �������",
  confirmed_at DATETIME COMMENT "����� ������������� �����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������",  
  PRIMARY KEY (user_��, friend_id) COMMENT "��������� ��������� ����"
) COMMENT "������� ������";

-- ������� �������� ��������� ���������
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� �������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������� ������";

-- ������� �����
CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� �����",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� ������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������";

-- ������� ����� ������������� � �����
CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  user_�� INT UNSIGNED NOT NULL COMMENT "������ �� ������������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (community_id, user_��) COMMENT "��������� ��������� ����"
) COMMENT "��������� �����, ����� ����� �������������� � ��������";

-- ������� �����������
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  user_�� INT UNSIGNED NOT NULL COMMENT "������ �� ������������, ������� �������� ����",
  filename VARCHAR(255) NOT NULL COMMENT "���� � �����",
  size INT NOT NULL COMMENT "������ �����",
  metadata JSON COMMENT "���������� �����",
  media_type_id INT UNSIGNED NOT NULL COMMENT "������ �� ��� ��������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����������";

-- ������� ����� �����������
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "�������� ����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "���� �����������";


-- ������� ����� ������������� 
CREATE TABLE ���_������������ (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ��� VARCHAR(255) NOT NULL UNIQUE COMMENT "�������� ���� ������������",
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "���� ����� �������������";


-- ������ � ������� "�������" ���� "gender" �� ���� ��� ����� � �������� "���_������������"
ALTER TABLE profiles CHANGE gender ���_������������_�� INT NOT NULL;

-- ������� ������� 
CREATE TABLE ������ (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ��� VARCHAR(130) NOT NULL UNIQUE COMMENT "�������� ������",
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "����� ����������";

-- ������ � ������� "�������" ���� "city" �� ���� ��� ����� � �������� "������"
ALTER TABLE profiles CHANGE city �����_�� INT NOT NULL;
 
-- ������� ����� 
CREATE TABLE ������ (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ��� VARCHAR(130) NOT NULL UNIQUE COMMENT "�������� ������",
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������ ����������";

-- ������ � ������� "�������" ���� "" �� ���� ��� ����� � �������� "������"
ALTER TABLE profiles CHANGE country ������_�� INT NOT NULL;

-- ������� ����� 
CREATE TABLE ������ (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ��� VARCHAR(130) NOT NULL UNIQUE COMMENT "�������� ������",
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
)COMMENT "������ ����������";


-- ������� ������ ��� �����������
CREATE TABLE �����_����������� (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ���������_�� INT NOT NULL COMMENT "������ �� ���������",
  ���� INT NOT NULL DEFAULT 0 COMMENT "����",
  ����_������������� INT NOT DEFAULT 0 NULL COMMENT "������������� ����",
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����� �� ����������";

-- ������� ������ ��� �������������
CREATE TABLE �����_��_������������� (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ������������_�� INT UNSIGNED NOT NULL COMMENT "������ �� ������������",
  ���� INT NOT NULL DEFAULT 0 COMMENT "����",
  ����_������������� INT NOT NULL DEFAULT 0 COMMENT "������������� ����", 
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����� �� ������������";


-- ������� ������
CREATE TABLE ����� (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  ������������_�� INT UNSIGNED NOT NULL COMMENT "������ �� ������������ ���������� ����",
  ����� TEXT NOT NULL COMMENT "����� �����",
  ����_�������� DATETIME DEFAULT NOW() COMMENT "����� �������� ������",
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "�����";


-- ������� ������ ��� ������
CREATE TABLE �����_��_����� (
  �� INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  ����_�� INT UNSIGNED NOT NULL COMMENT "������ �� ����",
  ���� INT NOT NULL DEFAULT 0 COMMENT "����",
  ����_������������� INT NOT NULL DEFAULT 0 COMMENT "������������� ����", 
  ����_�������� DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  ����_��������� DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����� �� ������������";