USE Training;

-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
-- SELECT * FROM ACCOUNT A
-- INNER JOIN DEPARTMENT D ON A.department_id = D.id
-- WHERE D.name = 'Sale';

CREATE VIEW Sale_department_employee_tbl AS
(
    SELECT * FROM Account
    WHERE department_id IN (SELECT id FROM Department WHERE name = 'Sale')
);
SELECT * FROM Sale_department_employee_tbl;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW List_account_join_group_top_tbl AS (
	SELECT A.*, COUNT(G.group_id) NumberOfGroupParticipated FROM ACCOUNT A
	INNER JOIN GroupMember G ON G.account_id =A.id
	GROUP BY G.account_id
	ORDER BY COUNT(G.group_id) DESC
	LIMIT 3
);
SELECT * FROM List_account_join_group_top_tbl;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
CREATE VIEW long_question_tbl AS 
(
	SELECT * FROM Question
    WHERE LENGTH(content) > 300
);
DELETE FROM QUESTION
WHERE LENGTH(content) > 300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
SELECT * FROM Department;

CREATE VIEW List_department_top_tbl AS (
	SELECT D.id, D.name, COUNT(A.id) numberEmployeeOfDepartment FROM Account A
	INNER JOIN Department D ON A.department_id = D.id
	GROUP BY D.id
	ORDER BY numberEmployeeOfDepartment DESC
	LIMIT 3
);
SELECT * FROM List_department_top_tbl;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW question_of_Nguyen AS 
(
	SELECT * FROM Question 
	WHERE creator_id IN (SELECT id FROM Account WHERE full_name LIKE 'Nguyen%')
);
SELECT * FROM question_of_Nguyen;