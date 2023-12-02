CREATE DATABASE ManagementFresher;

-- DROP DATABASE ManagementFresher;

USE ManagementFresher;

-- DROP TABLE IF EXISTS Trainee;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
CREATE TABLE Trainee(
	trainee_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    full_name NVARCHAR(150) NOT NULL,
    birth_day DATE,
    gender ENUM('male', 'female', 'unknown'),
    et_iq INT DEFAULT 0 
		CHECK (et_iq >= 0 AND et_iq <= 20),
    et_gmath INT DEFAULT 0 
		CHECK (et_gmath >= 0 AND et_gmath <= 20),
    et_english INT DEFAULT 0
		CHECK (et_english >= 0 AND et_english <= 50),
    training_class NVARCHAR(50),
    evaluation_notes NVARCHAR(250)
);


SHOW CREATE TABLE Trainee;

INSERT INTO Trainee (full_name, birth_day, gender, et_iq, 
et_gmath, et_english, training_class, evaluation_notes)
VALUES ('Pham Hong Thuan 1', '2000-01-24', 'male', 8, 9, 8, 'IT001', 'No'),
('Pham Hong Thuan 2', '2000-01-24', 'male', 18, 9, 28, 'IT001', 'No'),
('Pham Hong Thuan 3', '2000-01-24', 'male', 7, 19, 8, 'IT001', 'No'),
('Pham Hong Thuan 4', '2000-01-24', 'male', 8, 4, 38, 'IT001', 'No'),
('Pham Hong Thuan 5', '2000-01-24', 'male', 18, 9, 8, 'IT001', 'No');

INSERT INTO Trainee (full_name, birth_day, gender, 
			training_class, evaluation_notes)
VALUES ('Pham Hong Thuan 2', '2000-01-24', 'male',  'IT001', 'No');

SELECT * FROM Trainee;

DELETE FROM Trainee WHERE trainee_id IN (1, 2, 3, 4);

-- Question 2: thêm trường VTI_Account với điều kiện not null & unique
ALTER TABLE Trainee
ADD COLUMN vti_account NVARCHAR(100) NOT NULL;

-- Add được UNIQUE 
ALTER TABLE Trainee
CHANGE COLUMN vti_account vti_account NVARCHAR(100) UNIQUE;

INSERT INTO Trainee (vti_account, full_name, birth_day, gender, 
			training_class, evaluation_notes)
VALUES ('thuanph03','Pham Hong Thuan 3', '2000-01-24', 'male',  'IT001', 'No');

-- Exercise 2: Data Types
CREATE TABLE Exercise2(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    namess VARCHAR(100),
    codes CHAR(5),
    modified_date DATETIME
);

INSERT INTO Exercise2(namess, codes, modified_date)
VALUES ('John', 'CODE1', '2023-11-30 9:55:12');

INSERT INTO Exercise2(namess, codes)
VALUES ('Jan', 'CODE2');

SELECT * FROM Exercise2;

-- Exercise 3: Data Types (2)
CREATE TABLE Exercise3(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    namess VARCHAR(100),
    birth_day DATE,
    gender BIT,
    is_delete_flag ENUM('0', '1')
);

INSERT INTO Exercise3(namess, birth_day, gender, is_delete_flag)
VALUES ('John', '2003-11-30', 0, '1');
INSERT INTO Exercise3(namess, birth_day, gender, is_delete_flag)
VALUES ('Jan', '2003-01-10', 1, '0');

SELECT  namess, birth_day, 
CASE 
	WHEN gender = 0 THEN 'male'
    WHEN gender = 1 THEN 'female'
    ELSE 'unknown'
END AS gender,
CASE 
	WHEN is_delete_flag = '0' THEN 'đang hoạt động,'
    ELSE 'đã xóa'
END AS is_delete_flag
FROM Exercise3;