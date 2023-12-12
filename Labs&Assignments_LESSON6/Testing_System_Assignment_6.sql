-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó

USE Training;

DROP PROCEDURE IF EXISTS  getAccountInDept;
DELIMITER $$
CREATE PROCEDURE getAccountInDept(IN name_dept NVARCHAR(64), OUT account_out NVARCHAR(64))
BEGIN
	SELECT A.full_name INTO account_out FROM Account A
    INNER JOIN Department D ON A.department_id = D.id
    WHERE D.name = name_dept;
END$$
DELIMITER ;

CALL getAccountInDept('Sale', @account_out);
SELECT @account_out;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS  getNumAccInGroup;
DELIMITER $$
CREATE PROCEDURE getNumAccInGroup()
BEGIN
	SELECT GM.group_id, G.name, COUNT(account_id) `Number Of Member` FROM GroupMember GM
	INNER JOIN `Group` G ON G.id = GM.group_id
	GROUP BY group_id;
END$$
DELIMITER ;

CALL getNumAccInGroup();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
DROP PROCEDURE IF EXISTS  numberQuestionInType;
DELIMITER $$
CREATE PROCEDURE numberQuestionInType()
BEGIN
	SELECT T.id, T.type, COUNT(Q.id) `Number Question In Type` FROM Question Q
	INNER JOIN QuestionType T ON T.id = Q.type_id
	WHERE YEAR(Q.created_date) = YEAR(NOW()) AND MONTH(Q.created_date) = MONTH(NOW())
	GROUP BY Q.type_id;
END$$
DELIMITER ;
CALL numberQuestionInType();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS  maxNumberQuestionInType;
DELIMITER $$
CREATE PROCEDURE maxNumberQuestionInType()
BEGIN
	SELECT type_id, COUNT(*) numberQuestionInType FROM Question
	WHERE id = (
		SELECT MAX(numberQuestion) 
		FROM (SELECT COUNT(*) numberQuestion FROM Question GROUP BY type_id) MQ
	)
	GROUP BY type_id;
END$$
DELIMITER ;
CALL maxNumberQuestionInType();


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS  getTypeName;
DELIMITER $$
CREATE PROCEDURE getTypeName()
BEGIN
	SELECT Q.type_id, T.type, COUNT(*) numberQuestionInType FROM Question Q
    INNER JOIN QuestionType T ON T.id = Q.type_id
	WHERE Q.id = (
		SELECT MAX(numberQuestion) 
		FROM (SELECT COUNT(*) numberQuestion FROM Question GROUP BY type_id) MQ
	)
	GROUP BY type_id;
END$$
DELIMITER ;
CALL getTypeName();
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS  getUserNameOrGroup;
DELIMITER $$
CREATE PROCEDURE getUserNameOrGroup(IN input_text NVARCHAR(64))
BEGIN
	SELECT user_name Result FROM Account
    WHERE user_name LIKE CONCAT('%', input_text, '%')
    UNION
    SELECT name Result FROM `Group`
    WHERE name LIKE CONCAT('%', input_text, '%');
END$$
DELIMITER ;
CALL getUserNameOrGroup('2');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

-- SELECT * FROM `position`;
-- SELECT * FROM department;
-- SELECT * FROM Account;

-- INSERT INTO `position`(name) VALUES ('Developer');
-- INSERT INTO department(name) VALUES ('Waiting');

-- select SUBSTRING_INDEX('phamhongthuan@gmail.com', "@", 1);

DROP PROCEDURE IF EXISTS  addNewAccount;
DELIMITER $$
CREATE PROCEDURE addNewAccount(IN full_name_in NVARCHAR(64), IN email_in NVARCHAR(64))
BEGIN
	INSERT INTO Account(user_name, full_name, email, department_id, position_id, created_date)
    VALUES (SUBSTRING_INDEX(email_in, "@", 1), full_name_in, email_in, 5, 4, CURDATE());
END$$
DELIMITER ;
CALL addNewAccount('Pham Thuan', 'phamhongthuan@gmail.com');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- INSERT INTO QuestionType(type)
-- VALUES('essay'), ('multiple-choice');

-- INSERT INTO Category(category)
-- VALUES('Category 1'), ('Category 2'),
-- ('Category 3'), ('Category 4');

-- INSERT INTO Question(content, category_id, type_id, creator_id, created_date)
-- VALUES('Lorem Ipsum is simply dummy text of the printing and typesetting industry CDE1?', 1, 1, 3, CURDATE()),
-- ('Lorem Ipsum is simply dummy text of the printing and typesetting industry 1?', 2, 1, 2, CURDATE()),
-- ('Lorem Ipsum is simply dummy text of the printing and typesetting industry 15?', 1, 2, 12, CURDATE()),
-- ('Lorem Ipsum is simply dummy text of the printing and typesetting industry 12E?', 4, 1, 6, CURDATE()),
-- ('Lorem Ipsum is simply dummy text of the printing and typesetting industry? 12', 3, 2, 21, CURDATE());

-- SELECT * FROM Question;
-- SELECT * FROM QuestionType;
-- SELECT * FROM Category;

DROP PROCEDURE IF EXISTS  getQuesMaxLength;
DELIMITER $$
CREATE PROCEDURE getQuesMaxLength(IN type_question_in NVARCHAR(64))
BEGIN
	SELECT Q.content FROM Question Q
	INNER JOIN QuestionType T ON T.id = Q.type_id
    WHERE T.type = type_question_in
	HAVING LENGTH(Q.content) IN (SELECT MAX(lenContent) FROM (
				SELECT LENGTH(content) lenContent FROM Question Q
				INNER JOIN QuestionType T ON T.id = Q.type_id
				WHERE T.type = type_question_in
			) MAXLENGHTCONT);
END$$
DELIMITER ;
CALL getQuesMaxLength('Essay');
CALL getQuesMaxLength('multiple-choice');


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS  delExamById;
DELIMITER $$
CREATE PROCEDURE delExamById(IN exam_id_in BIGINT)
BEGIN
	DELETE EQ.*, E.*FROM EXAM E
	INNER JOIN ExamQuestion EQ ON EQ.exam_id = E.id
	WHERE E.id = exam_id_in;
END$$
DELIMITER ;
CALL delExamById(1);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
SELECT (DATEDIFF(CURDATE(), '2020-12-12') / 365);

DROP PROCEDURE IF EXISTS  delExamCreate3Y;
DELIMITER $$
CREATE PROCEDURE delExamCreate3Y()
BEGIN
	DELETE EQ.*, E.*FROM EXAM E
	INNER JOIN ExamQuestion EQ ON EQ.exam_id = E.id
	WHERE (DATEDIFF(CURDATE(), E.created_date) / 365) > 3;
END$$
DELIMITER ;
CALL delExamCreate3Y();

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
-- nay