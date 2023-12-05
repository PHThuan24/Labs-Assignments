USE ManagementFresher;

-- Question 1: Thêm ít nhất 10 bản ghi vào table 
INSERT INTO Trainee (full_name, birth_day, gender, et_iq, 
et_gmath, et_english, training_class, evaluation_notes)
VALUES ('Pham Hong Thuan 1', '2000-01-24', 'male', 18, 19, 48, 'IT001', 'No'),
('Pham Hong Thuan 2', '2000-01-24', 'male', 18, 19, 38, 'IT001', null),
('Pham Hong Thuan 3', '2000-04-24', 'male', 17, 14, 44, 'IT001', 'No'),
('Pham Hong Thuan 4', '2000-06-24', 'female', 18, 16, 38, 'IT001', null),
('Pham Hong Thuan 5', '2000-01-24', 'male', 18, 9, 38, 'IT001', 'No'),
('Pham Hong Thuan 6', '2000-03-24', 'male', 18, 13, 30, 'IT001', 'No'),
('Pham Hong Thuan 7', '2000-01-24', 'male', 18, 19, 48, 'IT001', null),
('Pham Hong Thuan 8', '2000-06-24', 'female', 7, 19, 48, 'IT001', 'No'),
('Pham Hong Thuan 9', '2000-08-24', 'male', 8, 14, 38, 'IT001', 'No'),
('Pham Hong Thuan 10', '2000-10-24', 'female', 18, 9, 32, 'IT001', null);

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- nhóm chúng thành các tháng sinh khác nhau 
SELECT *  FROM Trainee
ORDER BY MONTH(BIRTH_DAY);

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT trainee_id ID, full_name 'Họ và Tên', 
ROUND(DATEDIFF(CURDATE(), birth_day) / 365, 0) Tuoi,
CASE 
	WHEN gender = 'male' THEN 'Nam'
    WHEN gender = 'female' THEN 'Nữ'
    ELSE 'Khác'
END AS 'Giới Tính'
FROM Trainee
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Trainee);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18
SELECT * FROM Trainee
WHERE (et_iq + et_gmath) >= 20
AND et_iq >= 8 AND et_gmath >= 8
AND et_english >= 18;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM Trainee
WHERE trainee_id = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "IT002". Hãy cập nhật
-- thông tin vào database
UPDATE Trainee
SET training_class = 'IT002'
WHERE trainee_id = 5;