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

SELECT *  FROM Account
WHERE id = (
	SELECT account_id FROM GroupMember
    GROUP BY account_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- MAX
SELECT MAX(numberOfGroup) FROM 
(
	SELECT COUNT(*) numberOfGroup 
    FROM GroupMember
    GROUP BY account_id
) A;

SELECT A.*, COUNT(*) numberOfGroup FROM GroupMember GM
INNER JOIN Account A ON A.id = GM.account_id
GROUP BY account_id
HAVING numberOfGroup IN (SELECT MAX(numberOfGroup) FROM 
	(
		SELECT COUNT(*) numberOfGroup 
		FROM GroupMember
		GROUP BY account_id
	) A
);

-- WITH
WITH
maxNumberOfGroup as ( SELECT max(numberOfGroup) as numberOfGroup FROM (SELECT count(*) as numberOfGroup FROM GroupMember GROUP BY account_id) a
),
accIds AS ( SELECT account_id FROM GroupMember
GROUP BY account_id
HAVING count(*) = (SELECT numberOfGroup FROM maxNumberOfGroup)
)
SELECT * FROM Account INNER JOIN accIds ON Account.id = accIds.account_id;

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

-- SỬ DỤNG MAX()
-- STEP 1: SELECT COUNT(*) DEM FROM Account GROUP BY department_id
-- STEP 2: SELECT MAX(DEM) FROM (SELECT COUNT(*) DEM FROM Account GROUP BY department_id) DER
-- STEP 3:
SELECT D.id, D.name FROM Account A
INNER JOIN Department D ON A.department_id = D.id
GROUP BY D.id
HAVING COUNT(A.id) IN (SELECT MAX(DEM) FROM (SELECT COUNT(*) DEM FROM Account GROUP BY department_id) DER);


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW question_of_Nguyen AS 
(
	SELECT * FROM Question 
	WHERE creator_id IN (SELECT id FROM Account WHERE full_name LIKE 'Nguyen%')
);
SELECT * FROM question_of_Nguyen;

-- SP
DROP PROCEDURE IF EXISTS getAllAccount;

DELIMITER $$
CREATE PROCEDURE getAllAccount()
BEGIN
    SELECT * FROM Account;
END$$
DELIMITER ;

CALL getAllAccount();

-- SP IN/OUT
DROP PROCEDURE IF EXISTS getUserNameByID;
DELIMITER $$
CREATE PROCEDURE getUserNameByID(IN account_id BIGINT, OUT user_name_out NVARCHAR(64))
BEGIN
	SELECT user_name INTO user_name_out FROM Account
    WHERE id = account_id;
END$$
DELIMITER ;

-- user_name laf 1 biến 
CALL getUserNameByID(9, @user_name);
SELECT @user_name;

-- 
DROP PROCEDURE IF EXISTS  getUserNameAndDepartment;
DELIMITER $$
CREATE PROCEDURE getUserNameAndDepartment(IN account_id BIGINT, OUT user_name_out NVARCHAR(64), OUT email_out NVARCHAR(64))
BEGIN
	SELECT user_name, email INTO user_name_out, email_out
    FROM Account
    WHERE id = account_id;
END$$
DELIMITER ;

CALL getUserNameAndDepartment(10, @user_name, @email);
SELECT @user_name, @email;

select * from account;


-- FUNCTION
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS avg_dept;
DELIMITER $$
CREATE FUNCTION avg_dept(dept_name NVARCHAR(64)) RETURNS DECIMAL(10, 2)
BEGIN
	DECLARE avt_of_dept DECIMAL(10, 2);
    SELECT AVG(a.salary) INTO avt_of_dept FROM Account a
    WHERE a.department_id = (SELECT id FROM Department WHERE name = dept_name);
    RETURN avt_of_dept;
END$$
DELIMITER ;

SELECT avg_dept('R&D');