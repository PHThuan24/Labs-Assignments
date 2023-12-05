USE Training;

-- Question 1: Thêm ít nhất 10 record vào mỗi table
INSERT INTO QuestionType(type)
VALUES ('Type 1'), ('Type 2'), ('Type 3'), ('Type 4'),('Type 5'), 
('Type 6'), ('Type 7'), ('Type 8'), ('Type 9'), ('Type 10');
SELECT * FROM QuestionType;

INSERT INTO Category(category)
VALUES ('Category 1'), ('Category 2'), ('Category 3'), ('Category 4'), ('Category 5'),
('Category 6'), ('Category 7'), ('Category 8'), ('Category 9'), ('Category 10');
SELECT * FROM Category;


INSERT INTO Question(content, category_id, type_id, creator_id, created_date)
VALUES ('Content Of Question 1', 1, 1, 1, CURDATE()),
('Content Of Question 2', 1, 6, 1, CURDATE()),
('Content Of Question 3', 1, 10, 1, CURDATE()),
('Content Of Question 4', 2, 2, 2, CURDATE()),
('Content Of Question 5', 1, 7, 2, CURDATE()),
('Content Of Question 6', 3, 2, 2, CURDATE()),
('Content Of Question 7', 4, 4, 2, CURDATE()),
('Content Of Question 8', 3, 3, 4, CURDATE()),
('Content Of Question 9', 4, 5, 4, CURDATE()),
('Content Of Question 10', 5, 8, 4, CURDATE()),
('Content Of Question 11', 6, 6, 4, CURDATE()),
('Content Of Question 12', 7, 3, 4, CURDATE()),
('Content Of Question 13', 1, 1, 5, CURDATE()),
('Content Of Question 14', 3, 2, 5, CURDATE()),
('Content Of Question 15', 5, 3, 5, CURDATE()),
('Content Of Question 16', 6, 4, 6, CURDATE()),
('Content Of Question 17', 7, 2, 6, CURDATE()),
('Content Of Question 18', 8, 3, 6, CURDATE());
SELECT * FROM QUESTION;

INSERT INTO Anwser(content, question_id, created_date)
VALUES ('Content Of Answer 1', 19, CURDATE()),
('Content Of Answer 2', 22, CURDATE()),
('Content Of Answer 3', 23, CURDATE()),
('Content Of Answer 4', 19, CURDATE()),
('Content Of Answer 5', 32, CURDATE()),
('Content Of Answer 6', 24, CURDATE()),
('Content Of Answer 7', 26, CURDATE()),
('Content Of Answer 8', 27, CURDATE()),
('Content Of Answer 9', 25, CURDATE()),
('Content Of Answer 10', 22, CURDATE()),
('Content Of Answer 11', 21, CURDATE()),
('Content Of Answer 12', 26, CURDATE()),
('Content Of Answer 13', 35, CURDATE()),
('Content Of Answer 14', 24, CURDATE()),
('Content Of Answer 16', 19, CURDATE()),
('Content Of Answer 17', 19, CURDATE()),
('Content Of Answer 18', 22, CURDATE()),
('Content Of Answer 19', 23, CURDATE());
SELECT * FROM Anwser;

INSERT INTO `Group`(name, creator_id, created_date)
VALUES('Group 1', 2, '2022-07-21'),
('Group 2', 3, CURDATE()),
('Group 3', 5, '2023-09-03'),
('Group 4', 11, CURDATE()),
('Group 5', 12, '2023-01-23'), 
('Group 6', 4, CURDATE());
SELECT * FROM `Group`;

-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM Department;
SELECT id AS ID, name AS 'Department Name' FROM Department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT id AS 'ID Of The Sale Department' FROM Department
WHERE name = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT * FROM Account
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Account);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 2
SELECT * FROM Account
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Account) AND department_id = 2;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT * FROM `Group`
WHERE created_date < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT question_id FROM Anwser
GROUP BY question_id
HAVING (SELECT COUNT(*) FROM Anwser) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT * FROM EXAM
WHERE duration >= 60 AND created_date < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `Group`
ORDER BY created_date DESC 
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(*) FROM ACCOUNT
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * FROM ACCOUNT
WHERE full_name LIKE 'N%' AND full_name LIKE '%x';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- SET SQL_SAFE_UPDATES = 1;

DELETE Q.*, E.* FROM  Exam E
INNER JOIN ExamQuestion Q ON Q.exam_id = E.id
WHERE created_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE E.*, Q.*  FROM  Question Q
INNER JOIN ExamQuestion E ON E.question_id = Q.id
WHERE content LIKE 'câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
UPDATE Account
SET full_name = 'Nguyễn Bá Lộc', 
email = 'loc.nguyenba@vti.com.vn'
WHERE id = 5;
SELECT * FROM Account WHERE id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE Account A
INNER JOIN GroupMember GM ON GM.account_id = A.id
INNER JOIN `Group` G ON G.id = GM.group_id
SET G.id = 4
WHERE A.id = 5;
